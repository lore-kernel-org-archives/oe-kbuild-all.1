Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509332F36
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678350558; x=1709886558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sAqvuE3e36iVtqO7mpMJHlwYEU6KHFttY94Oj74Sj4=;
  b=e7WtvEz+mbdZ7Nh9unm85y3wM32vIp22PM+oLyXzGSTV4m+RlvpB2CTC
   atDuBku+4HbmZitjRFBNqxpdFihy6t78pjf0phEdyyahF/jIwRSkNmX1t
   etqDYojjTVZ7BV4UI+fou8OyIifq4WNwpWe2A0pVVf+oF408Bipr4nZOH
   06ehi4Bil/F4G0YT6HmYg+lsEoXlwS7IqU5qA6yszxIYZoKBouOu0Mv8K
   junudDCQQQgaJnpwOvaavT1bexzuCtbo3ttynA9iC0UNc3+dN6y3BMgeu
   5OlF3Q0O5EXhWGW0Gh3cqwaqz4YX6ol1KkJZaxaztSKBb/ZwIKtnMW7Af
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333857804"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="333857804"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 00:29:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746232563"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="746232563"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 00:29:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBeG-0002np-09;
	Thu, 09 Mar 2023 08:29:16 +0000
Date: Thu, 9 Mar 2023 16:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:parallel-6.2-rc8-v12bis 12/12]
 arch/x86/kernel/smpboot.c:1550:76: error: 'sev_es_enable_key' undeclared
Message-ID: <202303091621.mjGSLJz6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc8-v12bis
head:   8a53f16b29065ddbde40a73415dae32d2f4c82e5
commit: 8a53f16b29065ddbde40a73415dae32d2f4c82e5 [12/12] x86/smpboot: Allow parallel bringup for SEV-ES
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230309/202303091621.mjGSLJz6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc8-v12bis
        git checkout 8a53f16b29065ddbde40a73415dae32d2f4c82e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091621.mjGSLJz6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from arch/x86/kernel/smpboot.c:42:
   arch/x86/kernel/smpboot.c: In function 'prepare_parallel_bringup':
>> arch/x86/kernel/smpboot.c:1550:76: error: 'sev_es_enable_key' undeclared (first use in this function)
    1550 |                 if (IS_ENABLED(AMD_MEM_ENCRYPT) && static_branch_unlikely(&sev_es_enable_key)) {
         |                                                                            ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/jump_label.h:509:41: note: in expansion of macro 'unlikely_notrace'
     509 | #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:509:58: note: in expansion of macro 'static_key_enabled'
     509 | #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
         |                                                          ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smpboot.c:1550:52: note: in expansion of macro 'static_branch_unlikely'
    1550 |                 if (IS_ENABLED(AMD_MEM_ENCRYPT) && static_branch_unlikely(&sev_es_enable_key)) {
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smpboot.c:1550:76: note: each undeclared identifier is reported only once for each function it appears in
    1550 |                 if (IS_ENABLED(AMD_MEM_ENCRYPT) && static_branch_unlikely(&sev_es_enable_key)) {
         |                                                                            ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/jump_label.h:509:41: note: in expansion of macro 'unlikely_notrace'
     509 | #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:509:58: note: in expansion of macro 'static_key_enabled'
     509 | #define static_branch_unlikely(x)       unlikely_notrace(static_key_enabled(&(x)->key))
         |                                                          ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/smpboot.c:1550:52: note: in expansion of macro 'static_branch_unlikely'
    1550 |                 if (IS_ENABLED(AMD_MEM_ENCRYPT) && static_branch_unlikely(&sev_es_enable_key)) {
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/sev_es_enable_key +1550 arch/x86/kernel/smpboot.c

  1512	
  1513	
  1514	/*
  1515	 * We can do 64-bit AP bringup in parallel if the CPU reports its APIC
  1516	 * ID in CPUID (either leaf 0x0B if we need the full APIC ID in X2APIC
  1517	 * mode, or leaf 0x01 if 8 bits are sufficient). Otherwise it's too
  1518	 * hard. And not for SEV-ES guests because they can't use CPUID that
  1519	 * early.
  1520	 */
  1521	static bool __init prepare_parallel_bringup(void)
  1522	{
  1523		if (IS_ENABLED(CONFIG_X86_32) || boot_cpu_data.cpuid_level < 1)
  1524			return false;
  1525	
  1526		if (x2apic_mode) {
  1527			unsigned int eax, ebx, ecx, edx;
  1528	
  1529			if (boot_cpu_data.cpuid_level < 0xb)
  1530				return false;
  1531	
  1532			/*
  1533			 * To support parallel bringup in x2apic mode, the AP will need
  1534			 * to obtain its APIC ID from CPUID 0x0B, since CPUID 0x01 has
  1535			 * only 8 bits. Check that it is present and seems correct.
  1536			 */
  1537			cpuid_count(0xb, 0, &eax, &ebx, &ecx, &edx);
  1538	
  1539			/*
  1540			 * AMD says that if executed with an umimplemented level in
  1541			 * ECX, then it will return all zeroes in EAX. Intel says it
  1542			 * will return zeroes in both EAX and EBX. Checking only EAX
  1543			 * should be sufficient.
  1544			 */
  1545			if (!eax) {
  1546				pr_info("Disabling parallel bringup because CPUID 0xb looks untrustworthy\n");
  1547				return false;
  1548			}
  1549	
> 1550			if (IS_ENABLED(AMD_MEM_ENCRYPT) && static_branch_unlikely(&sev_es_enable_key)) {
  1551				pr_debug("Using SEV-ES CPUID 0xb for parallel CPU startup\n");
  1552				smpboot_control = STARTUP_APICID_SEV_ES;
  1553			} else if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
  1554				/*
  1555				 * Other forms of memory encryption need to implement a way of
  1556				 * finding the APs' APIC IDs that early.
  1557				 */
  1558				return false;
  1559			} else {
  1560				pr_debug("Using CPUID 0xb for parallel CPU startup\n");
  1561				smpboot_control = STARTUP_APICID_CPUID_0B;
  1562			}
  1563		} else {
  1564			if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
  1565				return false;
  1566	
  1567			/* Without X2APIC, what's in CPUID 0x01 should suffice. */
  1568			pr_debug("Using CPUID 0x1 for parallel CPU startup\n");
  1569			smpboot_control = STARTUP_APICID_CPUID_01;
  1570		}
  1571	
  1572		cpuhp_setup_state_nocalls(CPUHP_BP_PARALLEL_DYN, "x86/cpu:kick",
  1573					  native_cpu_kick, NULL);
  1574	
  1575		return true;
  1576	}
  1577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
