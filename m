Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C16427FA9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634446; cv=none; b=DfSsh+1Q1frwSeY2apVNXfZ4qw3KpaWDkZU6n1r64dbhoGszy+nxLyAUs1XLxaK74hIkQqCOrm0Pzsdd7p+27M7amKMnfTe61TMJOv+Kzq4wKyFN/koRmIlAmti6zPBlu6CK8+kom6eoM8zQFyO5HgGqe5r3KKlBdfyARPC7XbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634446; c=relaxed/simple;
	bh=xFk4JARWLj4w3qfU/k5NNUTYbTx1BhnCzAO+3q+v4mQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ckHZNRqKk2XxzPyTgBNV9WBah9Z1uGYK6cRcYp4AOvBcI8tAgXWvjA1OqJiNOcKCPyVEU7gSZjZTtxdv9JAjc3+JAnAQl+f2vc/8SDPZFkbR+oPEsLLzhMyUhfBzdzzuf+z0J8q1Irp5zvc0Q4jTnodj81r3jCw4AhsTdEtIqWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Itz/1CO9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Itz/1CO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786634444; x=1818170444;
  h=date:from:to:cc:subject:message-id;
  bh=xFk4JARWLj4w3qfU/k5NNUTYbTx1BhnCzAO+3q+v4mQ=;
  b=Itz/1CO9z1LxQRhicCsTdwoPeQNufFTnnN1yC5i26KpvNSVBGW4oj1LX
   YZ0I87GHpZ1Hqyr5eDwmPHJJ1uy9KeV6/+FiVrZ3hZhtmNs2HNfz6xt3N
   RqXlXstGF0H6p7AVzXopL8qbrXqIudSY12yVcW4QoJUw5M85y4slkhDNY
   kgNlJwVQdZE8h2dpw7LJsDdbU77YncsWF+ScKz8i+lRJ2ShUZBNmnCYD4
   sxVygrYd4WVDEIQ4xygvinazpXmCiqkDDn6vNbCHNHs88tPpXlLpyPxbH
   2oeMRNHIOrg8+GYqHsZphe8vF10Zgqw1aw1zsZQPvC+r+CL6cHEcTkexd
   g==;
X-CSE-ConnectionGUID: CXjthJeuQ8Cx6/m+6sn63w==
X-CSE-MsgGUID: +CmFq3MQSiCNm1F+8aWGHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98567576"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="98567576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 08:20:43 -0700
X-CSE-ConnectionGUID: l8SL0bxZRpKq3ZEH9qh7+Q==
X-CSE-MsgGUID: KAu4/wwfR1yLjYzR+a+UKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="261332393"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2026 08:20:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuXEV-00000000VhU-2Q4L;
	Thu, 13 Aug 2026 15:20:39 +0000
Date: Thu, 13 Aug 2026 23:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/platform/x86/acer-wmi.c:1944:49: error: passing argument 1 of
 'platform_profile_register' from incompatible pointer type
Message-ID: <202608132328.HYTy1Hwz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kurt,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 0563cdc99811697cb675ce01bb57360413f3cd2a [1/1] BACKPORT: UPSTREAM: ACPI: platform_profile: Remove platform_profile_handler from exported symbols
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608132328.HYTy1Hwz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132328.HYTy1Hwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608132328.HYTy1Hwz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_profile_setup':
   drivers/platform/x86/acer-wmi.c:1928:41: error: 'struct platform_profile_handler' has no member named 'profile_get'
    1928 |                 platform_profile_handler.profile_get =
         |                                         ^
   drivers/platform/x86/acer-wmi.c:1930:41: error: 'struct platform_profile_handler' has no member named 'profile_set'
    1930 |                 platform_profile_handler.profile_set =
         |                                         ^
>> drivers/platform/x86/acer-wmi.c:1944:49: error: passing argument 1 of 'platform_profile_register' from incompatible pointer type [-Wincompatible-pointer-types]
    1944 |                 err = platform_profile_register(&platform_profile_handler);
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                 |
         |                                                 struct platform_profile_handler *
   In file included from drivers/platform/x86/acer-wmi.c:22:
   include/linux/platform_profile.h:48:57: note: expected 'struct device *' but argument is of type 'struct platform_profile_handler *'
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                                          ~~~~~~~~~~~~~~~^~~
   drivers/platform/x86/acer-wmi.c:1944:23: error: too few arguments to function 'platform_profile_register'
    1944 |                 err = platform_profile_register(&platform_profile_handler);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:48:16: note: declared here
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_thermal_profile_change':
   drivers/platform/x86/acer-wmi.c:2036:17: error: too few arguments to function 'platform_profile_notify'
    2036 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:56:6: note: declared here
      56 | void platform_profile_notify(struct device *dev);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_probe':
   drivers/platform/x86/acer-wmi.c:2598:17: error: too few arguments to function 'platform_profile_remove'
    2598 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:51:5: note: declared here
      51 | int platform_profile_remove(struct device *dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/acer-wmi.c: In function 'acer_platform_remove':
   drivers/platform/x86/acer-wmi.c:2621:17: error: too few arguments to function 'platform_profile_remove'
    2621 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:51:5: note: declared here
      51 | int platform_profile_remove(struct device *dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_refresh':
   drivers/platform/x86/thinkpad_acpi.c:10603:17: error: too few arguments to function 'platform_profile_notify'
   10603 |                 platform_profile_notify();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/thinkpad_acpi.c:60:
   include/linux/platform_profile.h:56:6: note: declared here
      56 | void platform_profile_notify(struct device *dev);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: At top level:
   drivers/platform/x86/thinkpad_acpi.c:10608:10: error: 'struct platform_profile_handler' has no member named 'profile_get'
   10608 |         .profile_get = dytc_profile_get,
         |          ^~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10608:24: error: initialization of 'const char *' from incompatible pointer type 'int (*)(struct platform_profile_handler *, enum platform_profile_option *)' [-Wincompatible-pointer-types]
   10608 |         .profile_get = dytc_profile_get,
         |                        ^~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10608:24: note: (near initialization for 'dytc_profile.name')
   drivers/platform/x86/thinkpad_acpi.c:10609:10: error: 'struct platform_profile_handler' has no member named 'profile_set'
   10609 |         .profile_set = dytc_profile_set,
         |          ^~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10609:24: error: initialization of 'struct device *' from incompatible pointer type 'int (*)(struct platform_profile_handler *, enum platform_profile_option)' [-Wincompatible-pointer-types]
   10609 |         .profile_set = dytc_profile_set,
         |                        ^~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c:10609:24: note: (near initialization for 'dytc_profile.dev')
   drivers/platform/x86/thinkpad_acpi.c: In function 'tpacpi_dytc_profile_init':
>> drivers/platform/x86/thinkpad_acpi.c:10681:41: error: passing argument 1 of 'platform_profile_register' from incompatible pointer type [-Wincompatible-pointer-types]
   10681 |         err = platform_profile_register(&dytc_profile);
         |                                         ^~~~~~~~~~~~~
         |                                         |
         |                                         struct platform_profile_handler *
   include/linux/platform_profile.h:48:57: note: expected 'struct device *' but argument is of type 'struct platform_profile_handler *'
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                                          ~~~~~~~~~~~~~~~^~~
   drivers/platform/x86/thinkpad_acpi.c:10681:15: error: too few arguments to function 'platform_profile_register'
   10681 |         err = platform_profile_register(&dytc_profile);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:48:16: note: declared here
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/thinkpad_acpi.c: In function 'dytc_profile_exit':
   drivers/platform/x86/thinkpad_acpi.c:10701:9: error: too few arguments to function 'platform_profile_remove'
   10701 |         platform_profile_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:51:5: note: declared here
      51 | int platform_profile_remove(struct device *dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/dell/dell-pc.c: In function 'thermal_init':
   drivers/platform/x86/dell/dell-pc.c:250:24: error: 'struct platform_profile_handler' has no member named 'profile_get'
     250 |         thermal_handler->profile_get = thermal_platform_profile_get;
         |                        ^~
   drivers/platform/x86/dell/dell-pc.c:251:24: error: 'struct platform_profile_handler' has no member named 'profile_set'
     251 |         thermal_handler->profile_set = thermal_platform_profile_set;
         |                        ^~
>> drivers/platform/x86/dell/dell-pc.c:263:41: error: passing argument 1 of 'platform_profile_register' from incompatible pointer type [-Wincompatible-pointer-types]
     263 |         ret = platform_profile_register(thermal_handler);
         |                                         ^~~~~~~~~~~~~~~
         |                                         |
         |                                         struct platform_profile_handler *
   In file included from drivers/platform/x86/dell/dell-pc.c:20:
   include/linux/platform_profile.h:48:57: note: expected 'struct device *' but argument is of type 'struct platform_profile_handler *'
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                                          ~~~~~~~~~~~~~~~^~~
   drivers/platform/x86/dell/dell-pc.c:263:15: error: too few arguments to function 'platform_profile_register'
     263 |         ret = platform_profile_register(thermal_handler);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:48:16: note: declared here
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-pc.c: In function 'thermal_cleanup':
   drivers/platform/x86/dell/dell-pc.c:275:17: error: too few arguments to function 'platform_profile_remove'
     275 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:51:5: note: declared here
      51 | int platform_profile_remove(struct device *dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/hp/hp-wmi.c: In function 'thermal_profile_setup':
   drivers/platform/x86/hp/hp-wmi.c:1585:41: error: 'struct platform_profile_handler' has no member named 'profile_get'
    1585 |                 platform_profile_handler.profile_get = platform_profile_omen_get;
         |                                         ^
   drivers/platform/x86/hp/hp-wmi.c:1586:41: error: 'struct platform_profile_handler' has no member named 'profile_set'
    1586 |                 platform_profile_handler.profile_set = platform_profile_omen_set;
         |                                         ^
   drivers/platform/x86/hp/hp-wmi.c:1602:41: error: 'struct platform_profile_handler' has no member named 'profile_get'
    1602 |                 platform_profile_handler.profile_get = platform_profile_victus_get;
         |                                         ^
   drivers/platform/x86/hp/hp-wmi.c:1603:41: error: 'struct platform_profile_handler' has no member named 'profile_set'
    1603 |                 platform_profile_handler.profile_set = platform_profile_victus_set;
         |                                         ^
   drivers/platform/x86/hp/hp-wmi.c:1620:41: error: 'struct platform_profile_handler' has no member named 'profile_get'
    1620 |                 platform_profile_handler.profile_get = hp_wmi_platform_profile_get;
         |                                         ^
   drivers/platform/x86/hp/hp-wmi.c:1621:41: error: 'struct platform_profile_handler' has no member named 'profile_set'
    1621 |                 platform_profile_handler.profile_set = hp_wmi_platform_profile_set;
         |                                         ^
>> drivers/platform/x86/hp/hp-wmi.c:1630:41: error: passing argument 1 of 'platform_profile_register' from incompatible pointer type [-Wincompatible-pointer-types]
    1630 |         err = platform_profile_register(&platform_profile_handler);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct platform_profile_handler *
   In file included from drivers/platform/x86/hp/hp-wmi.c:24:
   include/linux/platform_profile.h:48:57: note: expected 'struct device *' but argument is of type 'struct platform_profile_handler *'
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                                          ~~~~~~~~~~~~~~~^~~
   drivers/platform/x86/hp/hp-wmi.c:1630:15: error: too few arguments to function 'platform_profile_register'
    1630 |         err = platform_profile_register(&platform_profile_handler);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:48:16: note: declared here
      48 | struct device *platform_profile_register(struct device *dev, const char *name,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/hp/hp-wmi.c: In function 'hp_wmi_bios_remove':
   drivers/platform/x86/hp/hp-wmi.c:1694:17: error: too few arguments to function 'platform_profile_remove'
    1694 |                 platform_profile_remove();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_profile.h:51:5: note: declared here
      51 | int platform_profile_remove(struct device *dev);
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/platform_profile_register +1944 drivers/platform/x86/acer-wmi.c

6bb5153dfbaf88f SungHwan Jung 2023-11-24  1922  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1923  static int acer_platform_profile_setup(void)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1924  {
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1925  	if (quirks->predator_v4) {
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1926  		int err;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1927  
6bb5153dfbaf88f SungHwan Jung 2023-11-24 @1928  		platform_profile_handler.profile_get =
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1929  			acer_predator_v4_platform_profile_get;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1930  		platform_profile_handler.profile_set =
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1931  			acer_predator_v4_platform_profile_set;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1932  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1933  		set_bit(PLATFORM_PROFILE_PERFORMANCE,
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1934  			platform_profile_handler.choices);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1935  		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1936  			platform_profile_handler.choices);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1937  		set_bit(PLATFORM_PROFILE_BALANCED,
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1938  			platform_profile_handler.choices);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1939  		set_bit(PLATFORM_PROFILE_QUIET,
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1940  			platform_profile_handler.choices);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1941  		set_bit(PLATFORM_PROFILE_LOW_POWER,
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1942  			platform_profile_handler.choices);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1943  
6bb5153dfbaf88f SungHwan Jung 2023-11-24 @1944  		err = platform_profile_register(&platform_profile_handler);
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1945  		if (err)
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1946  			return err;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1947  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1948  		platform_profile_support = true;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1949  
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1950  		/* Set default non-turbo profile  */
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1951  		last_non_turbo_profile =
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1952  			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1953  	}
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1954  	return 0;
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1955  }
6bb5153dfbaf88f SungHwan Jung 2023-11-24  1956  

:::::: The code at line 1944 was first introduced by commit
:::::: 6bb5153dfbaf88fa4b40ef50b706d2fb186ed92e platform/x86: acer-wmi: Add platform profile and mode key support for Predator PHN16-71

:::::: TO: SungHwan Jung <onenowy@gmail.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
