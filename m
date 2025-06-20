Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C77817E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 00:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378325; cv=none; b=FpaJeQjsRn2ClmKbxdC4Vnzwvrm5dO5V7ME1jqGZBvXUUgHx072uDptIVK3r8kucDMyUenYEIBZIqLY/6QzktSmMCzzx0z3TYy6OwdqjVwqNFVhqrs3rWmgxpSfu8kzeM4uZksBZPTkfRcW8E6PQSpWZn1T9/QUdxnHvLVsvuYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378325; c=relaxed/simple;
	bh=LF0zQgIfSA01x3r/OQ49hz/YL8QJ3vGPAIfEJjbmBl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXNZvuXwGTPhdX4zvgYuuJT17MHMdSXVfgC132A+k3aQqF5JLnLz89w8bATw9m0z53QzlhyYcNCnhPahXb078nmkbbnblwMnkWGsOKJhxbpSDkyYVd1LNDk5vMQfaOW8N9h4gAJb7oaNTT8WkEFlzDrrVAmsagic9MOoDmaafKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHsVaFbB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHsVaFbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750378324; x=1781914324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LF0zQgIfSA01x3r/OQ49hz/YL8QJ3vGPAIfEJjbmBl4=;
  b=CHsVaFbB/zbZ1bOttI2kMPeL4f263iiRioozry3HSj41yfuuRk/fkKmd
   2zDX5E0bw9OHeooZHv6NWAI3g+XOqRxO9QoRp/A+o1Z3qCMV8+zKfjCxW
   t2gb7x6s+cXNIl0KfgmRhYscKk+QxioGEaI1bznHLVeRjcMHhfA2TJrC2
   a43GM6qN8miKwsJVW9gBk+yN7CUg1SONg8NlN5o7rlrcXo1KZh6v/67nK
   g5gYPY7+5ehPRBcd/wDZJ6cHVck5yFwIZ1wLaEBGaFhi6ElcrDEmHiJ9w
   5aI2d2ktmA42YJ8Z2Go/pANj6B7jcICKOWwjw3sGDXEhZH4J1lygale+X
   Q==;
X-CSE-ConnectionGUID: D2LlcYW1QEW+RHYGEKlIhA==
X-CSE-MsgGUID: 7XVLcD+jR/uycnIuiufdVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52776098"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52776098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 17:12:03 -0700
X-CSE-ConnectionGUID: BkyAC0BxTsmv7TWKX6rgVw==
X-CSE-MsgGUID: chBuHG7+R3+iDbO86OwHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150258493"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2025 17:12:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSPMN-000LCA-2H;
	Fri, 20 Jun 2025 00:11:59 +0000
Date: Fri, 20 Jun 2025 08:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2974/2974] include/acpi/processor.h:221:2:
 error: unknown type name 'phys_cpuid_t'
Message-ID: <202506200807.gBMXP8Nw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi heppen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0bb9efd4883938dec34f710bce07ec3ecf5a04bd
commit: c3fe0dc62217d6faa76128ed26d64e421767919e [2974/2974] cpufreq: Add SEEP governor for hardware-managed P-states
config: arm64-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200807.gBMXP8Nw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200807.gBMXP8Nw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200807.gBMXP8Nw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/acpi/cppc_acpi.h:17,
                    from drivers/cpufreq/cpufreq_seep.c:13:
>> include/acpi/processor.h:221:2: error: unknown type name 'phys_cpuid_t'
     221 |  phys_cpuid_t phys_id; /* CPU hardware ID such as APIC ID for x86 */
         |  ^~~~~~~~~~~~
   include/acpi/processor.h:350:1: error: unknown type name 'phys_cpuid_t'
     350 | phys_cpuid_t acpi_get_phys_id(acpi_handle, int type, u32 acpi_id);
         | ^~~~~~~~~~~~
   include/acpi/processor.h:351:1: error: unknown type name 'phys_cpuid_t'
     351 | phys_cpuid_t acpi_map_madt_entry(u32 acpi_id);
         | ^~~~~~~~~~~~
   include/acpi/processor.h:352:20: error: unknown type name 'phys_cpuid_t'
     352 | int acpi_map_cpuid(phys_cpuid_t phys_id, u32 acpi_id);
         |                    ^~~~~~~~~~~~
   include/acpi/processor.h:354:1: error: unknown type name 'phys_cpuid_t'
     354 | phys_cpuid_t acpi_id_to_phys_cpuid(u32 acpi_id);
         | ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE
   Depends on [n]: CPU_FREQ [=y] && (ARM || ARM64 [=y]) && ACPI_CPPC_CPUFREQ [=n]
   Selected by [m]:
   - CPU_FREQ_GOV_SEEP [=m] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])


vim +/phys_cpuid_t +221 include/acpi/processor.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  217  
^1da177e4c3f41 Linus Torvalds    2005-04-16  218  struct acpi_processor {
^1da177e4c3f41 Linus Torvalds    2005-04-16  219  	acpi_handle handle;
^1da177e4c3f41 Linus Torvalds    2005-04-16  220  	u32 acpi_id;
828aef376d7a12 Catalin Marinas   2015-03-24 @221  	phys_cpuid_t phys_id;	/* CPU hardware ID such as APIC ID for x86 */
af8f3f514d193e Hanjun Guo        2015-01-04  222  	u32 id;		/* CPU logical ID allocated by OS */
^1da177e4c3f41 Linus Torvalds    2005-04-16  223  	u32 pblk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  224  	int performance_platform_limit;
01854e697a77a4 Luming Yu         2007-05-26  225  	int throttling_platform_limit;
ff55a9cebab024 Len Brown         2007-06-02  226  	/* 0 - states 0..n-th state available */
01854e697a77a4 Luming Yu         2007-05-26  227  
^1da177e4c3f41 Linus Torvalds    2005-04-16  228  	struct acpi_processor_flags flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  229  	struct acpi_processor_power power;
^1da177e4c3f41 Linus Torvalds    2005-04-16  230  	struct acpi_processor_performance *performance;
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  	struct acpi_processor_throttling throttling;
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  	struct acpi_processor_limit limit;
d9460fd227ed2c Zhang Rui         2008-01-17  233  	struct thermal_cooling_device *cdev;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  234  	struct device *dev; /* Processor device. */
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  235  	struct freq_qos_request perflib_req;
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  236  	struct freq_qos_request thermal_req;
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  

:::::: The code at line 221 was first introduced by commit
:::::: 828aef376d7a129547bc4ebb949965040177e3da ACPI / processor: Introduce phys_cpuid_t for CPU hardware ID

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
