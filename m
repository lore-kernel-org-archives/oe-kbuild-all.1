Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB102BAF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckJ+Cp//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701342056; x=1732878056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRpSQUL0scw4BkIt6PtCoQV0HVjcZ/l9S6fy0wVsjMw=;
  b=ckJ+Cp//RRitpx3Sb8fd3eYGmgA8yUdIusXUO7+A/MlZOxDCHTCdzk0W
   A92lNhhNbJ1ok2iu6fKPBzrIqDGDVagX4Z700VQVVTbNI8poZ5QkFnzCL
   ulFcwJ/Sm9pHovSynSWQdu0+5NDiCaAGBt+WmB/IqpvHTq1OOfDb5sn4T
   yu77vOqH5QAofyJlSLzo5iI4jEXoobtSKjHQWnFMvyqxHqhnb7mgdMJW6
   1ijlmLC0uzVUuJX5ZXyiqUXdtBMkkDQosQRtcI482KyycylER/OKXJdIe
   mvow6TCMHBssnIDp4U7QannR/rr7/JoAT1qN5QpUAiH7jBa0tAn7Oeyj7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="207307"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="207307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="17352577"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 03:00:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8emm-0001ja-1s;
	Thu, 30 Nov 2023 11:00:48 +0000
Date: Thu, 30 Nov 2023 19:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: SungHwan Jung <onenowy@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [linux-next:master 2858/4102] drivers/platform/x86/acer-wmi.c:1943:
 undefined reference to `platform_profile_notify'
Message-ID: <202311301842.ppdT4zWK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cd3fe06ff81cfb3a969acb12a56796cff5af23d
commit: d56254a5ccd38570d972a4471fac0ae17f38a734 [2858/4102] platform/x86: acer-wmi: Add platform profile and mode key support for Predator PHN16-71
config: x86_64-randconfig-071-20231104 (https://download.01.org/0day-ci/archive/20231130/202311301842.ppdT4zWK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301842.ppdT4zWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301842.ppdT4zWK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `acer_thermal_profile_change':
>> drivers/platform/x86/acer-wmi.c:1943: undefined reference to `platform_profile_notify'
   ld: vmlinux.o: in function `acer_platform_profile_setup':
>> drivers/platform/x86/acer-wmi.c:1851: undefined reference to `platform_profile_register'
   ld: vmlinux.o: in function `acer_platform_remove':
>> drivers/platform/x86/acer-wmi.c:2528: undefined reference to `platform_profile_remove'


vim +1943 drivers/platform/x86/acer-wmi.c

  1829	
  1830	static int acer_platform_profile_setup(void)
  1831	{
  1832		if (quirks->predator_v4) {
  1833			int err;
  1834	
  1835			platform_profile_handler.profile_get =
  1836				acer_predator_v4_platform_profile_get;
  1837			platform_profile_handler.profile_set =
  1838				acer_predator_v4_platform_profile_set;
  1839	
  1840			set_bit(PLATFORM_PROFILE_PERFORMANCE,
  1841				platform_profile_handler.choices);
  1842			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
  1843				platform_profile_handler.choices);
  1844			set_bit(PLATFORM_PROFILE_BALANCED,
  1845				platform_profile_handler.choices);
  1846			set_bit(PLATFORM_PROFILE_QUIET,
  1847				platform_profile_handler.choices);
  1848			set_bit(PLATFORM_PROFILE_LOW_POWER,
  1849				platform_profile_handler.choices);
  1850	
> 1851			err = platform_profile_register(&platform_profile_handler);
  1852			if (err)
  1853				return err;
  1854	
  1855			platform_profile_support = true;
  1856	
  1857			/* Set default non-turbo profile  */
  1858			last_non_turbo_profile =
  1859				ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
  1860		}
  1861		return 0;
  1862	}
  1863	
  1864	static int acer_thermal_profile_change(void)
  1865	{
  1866		/*
  1867		 * This mode key can rotate each mode or toggle turbo mode.
  1868		 * On battery, only ECO and BALANCED mode are available.
  1869		 */
  1870		if (quirks->predator_v4) {
  1871			u8 current_tp;
  1872			int tp, err;
  1873			u64 on_AC;
  1874			acpi_status status;
  1875	
  1876			err = ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
  1877				      &current_tp);
  1878	
  1879			if (err < 0)
  1880				return err;
  1881	
  1882			/* Check power source */
  1883			status = WMI_gaming_execute_u64(
  1884				ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
  1885				ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
  1886	
  1887			if (ACPI_FAILURE(status))
  1888				return -EIO;
  1889	
  1890			switch (current_tp) {
  1891			case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
  1892				if (!on_AC)
  1893					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
  1894				else if (cycle_gaming_thermal_profile)
  1895					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
  1896				else
  1897					tp = last_non_turbo_profile;
  1898				break;
  1899			case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
  1900				if (!on_AC)
  1901					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
  1902				else
  1903					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
  1904				break;
  1905			case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
  1906				if (!on_AC)
  1907					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
  1908				else if (cycle_gaming_thermal_profile)
  1909					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
  1910				else
  1911					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
  1912				break;
  1913			case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
  1914				if (!on_AC)
  1915					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
  1916				else if (cycle_gaming_thermal_profile)
  1917					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
  1918				else
  1919					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
  1920				break;
  1921			case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
  1922				if (!on_AC)
  1923					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
  1924				else if (cycle_gaming_thermal_profile)
  1925					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
  1926				else
  1927					tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
  1928				break;
  1929			default:
  1930				return -EOPNOTSUPP;
  1931			}
  1932	
  1933			status = WMI_gaming_execute_u64(
  1934				ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
  1935	
  1936			if (ACPI_FAILURE(status))
  1937				return -EIO;
  1938	
  1939			/* Store non-turbo profile for turbo mode toggle*/
  1940			if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
  1941				last_non_turbo_profile = tp;
  1942	
> 1943			platform_profile_notify();
  1944		}
  1945	
  1946		return 0;
  1947	}
  1948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
