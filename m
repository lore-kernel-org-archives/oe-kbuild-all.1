Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE875DF3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710358087; cv=none; b=f6XGDrvGNDRLqfVhy0ReJd+gsLLKX9V/o3vMANgtlZt5o3rNP9/I2miNNyXUeZt3G1dHAfp8VkiK2hbnwSk3M5KEwBkaqR48QbCUdNexi28wqsFN+QiX0z40Vu0eYjHUWQV88DPnyvYTxVdopMl115umwQ9xZGnmz2hWX2pDyTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710358087; c=relaxed/simple;
	bh=clfHuQVd6hCWkBC4FV2MM3ZX6sRtfdceahTbH64ssOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HJFjoDuSki+Ecq0pEXscdBXfTYRHMwYv0QMx1g9KmSj7X1qnupB3HQipnsR4rvcK5QXRewFT7c7VBzCujHNBUgQvKCAJC/TRdRDhpR8pDAPX8fzP598B3py6d71EEHnmNoxRoQxmx2z0Dk8yG9AoLDbaqZHOZc7HXTs/GJNqCi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrvLMBpd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrvLMBpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710358086; x=1741894086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=clfHuQVd6hCWkBC4FV2MM3ZX6sRtfdceahTbH64ssOo=;
  b=LrvLMBpdykJ2rOLwHVf0WbrEZVSRdrXRHRIltlzZsXD3ns4RZBEhvIGN
   eIC0tsXMqsXIr4kdOfekZxHyJF/IiD5WGZyg9OwFuIAt1/NGEw4nHmBQq
   w/2G5EFK8W047HRf5VBmZF/iBSXWsdpbHiElvXasNqE78byuTsR3iG0a/
   /Fzqz8005EZs+GxwMpluqVzXhOCEmzX2zVjob9XUY2eDSlo9MzoALcLJA
   OA728IcBVgE3VIUvVQ+PqtouCxkons7I+lHg0R339d7SqUojH4Wp7CtSX
   0h+ma/tOr2awcCj5YVPdFgPQH3QSe/wh0zQYzJZP0300l1qU2fcK07eDI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16599448"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16599448"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 12:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16714155"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Mar 2024 12:28:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkUGd-000Chb-1Q;
	Wed, 13 Mar 2024 19:27:59 +0000
Date: Thu, 14 Mar 2024 03:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/x86/include/asm/pci.h:133:9: error: implicit declaration of
 function 'to_pci_sysdata'
Message-ID: <202403140353.fJsWWpSD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: e56eccbb1eace16231eae0b697e943437edb9e46 x86/PCI: Add to_pci_sysdata() helper
date:   9 months ago
config: x86_64-buildonly-randconfig-004-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140353.fJsWWpSD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140353.fJsWWpSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140353.fJsWWpSD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/debug_locks.h:7,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from include/linux/mutex.h:16,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from drivers/acpi/acpi_platform.c:11:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({     \
         | 
   In file included from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/acpi/acpi_platform.c:11:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({     \
         | 
   In file included from include/linux/pci.h:1810,
                    from drivers/acpi/acpi_platform.c:17:
   arch/x86/include/asm/pci.h: In function '__pcibus_to_node':
>> arch/x86/include/asm/pci.h:133:9: error: implicit declaration of function 'to_pci_sysdata' [-Werror=implicit-function-declaration]
     133 |  return to_pci_sysdata(bus)->node;
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pci.h:133:28: error: invalid type argument of '->' (have 'int')
     133 |  return to_pci_sysdata(bus)->node;
         |                            ^~
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/acpi/osl.c:12:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({     \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/acpi/osl.c:12:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({     \
         | 
   In file included from include/linux/pci.h:1810,
                    from drivers/acpi/osl.c:18:
   arch/x86/include/asm/pci.h: In function '__pcibus_to_node':
>> arch/x86/include/asm/pci.h:133:9: error: implicit declaration of function 'to_pci_sysdata' [-Werror=implicit-function-declaration]
     133 |  return to_pci_sysdata(bus)->node;
         |         ^~~~~~~~~~~~~~
>> arch/x86/include/asm/pci.h:133:28: error: invalid type argument of '->' (have 'int')
     133 |  return to_pci_sysdata(bus)->node;
         |                            ^~
   drivers/acpi/osl.c: In function 'acpi_os_vprintf':
   drivers/acpi/osl.c:151:2: warning: function 'acpi_os_vprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     151 |  vsprintf(buffer, fmt, args);
         |  ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/to_pci_sysdata +133 arch/x86/include/asm/pci.h

   128	
   129	#ifdef CONFIG_NUMA
   130	/* Returns the node based on pci bus */
   131	static inline int __pcibus_to_node(const struct pci_bus *bus)
   132	{
 > 133		return to_pci_sysdata(bus)->node;
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
