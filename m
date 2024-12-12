Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926071E493
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 23:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734044585; cv=none; b=KXtAdZs9ubMYWLtXKnVHWBALkaLj73Lf/QcKOvYKWHTbkteBoeYTJPldkMP0dPUe4c6sByOYE2+Url4eNgfH6r3RirpeZLuTBIFHmKW17A6bCnciyboJ74buL0VDlpeNARuhXZkfnF0ah17un+ReXn4R0iS8gLfockTBOjeyRf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734044585; c=relaxed/simple;
	bh=RAjQtQ1sS2sjv7eRyX1+UwxycjwDAnHjLjKydis6vB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPV6Fna+XG7gR5xLzj0AAOWZFeI/XdRvTcgtDpORdP9XSNzM+/TXFHfyILNcZpyCk2GYD/8lLDVSWt51dTAUDS9KmOgV/zS0Nwb6hRfT3Vqeg1RLE6OSNQIkjIvUOR8X0VIOmvIZLvQBN0041RbV6qzLkalcZfA3pE4MM9ecwY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzmsynhZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzmsynhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734044583; x=1765580583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RAjQtQ1sS2sjv7eRyX1+UwxycjwDAnHjLjKydis6vB8=;
  b=SzmsynhZDRsoqTccPXE83OvLVm0p63LKsjbYB/l2ZKjyNgoDURjW22Ks
   E2qhCfR0Fi5LZjRn5Y8PNAMxH9WkatnmD5UycqaUskUS2ireX/dhCz5mZ
   6D/CtvLRCShD81O1y0lO6wOcf494PKTIVSxqwhtC5aPJFjHG/540WmLcV
   SY+3NEN+53uu9FHm+DcC05TZoL+vsG8ADE/yW4OCPRv6fSS2Gm/LwdRIH
   S8pIl3+2PjEsDzl3xmbjD2zexBmhnG1LHMmi8Gug5BjUD3MaWSLwqUxp+
   EdZDqnwemKmdSBL5kftbsHBoppjt+MfJD2I7RtlWRCTJ9CoAX9HeD5FX6
   A==;
X-CSE-ConnectionGUID: h3QgFkzbTDuLvjzwfuGLwQ==
X-CSE-MsgGUID: FqxUg0dARu6YQC1QmzxC3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33790147"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="33790147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 15:02:58 -0800
X-CSE-ConnectionGUID: ZO2lfu0cRIubJNSZFuUdiw==
X-CSE-MsgGUID: zM4PGIigRMOv3nDEJrcYcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101460865"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2024 15:02:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLsCq-000BSq-1V;
	Thu, 12 Dec 2024 23:02:52 +0000
Date: Fri, 13 Dec 2024 07:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] include/acpi/processor.h:221:9:
 error: unknown type name 'phys_cpuid_t'
Message-ID: <202412130652.MbID3V5Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ff5378fff024fcb2552e6da22811cf933fe4a4c0
commit: c3fe0dc62217d6faa76128ed26d64e421767919e [2579/2579] cpufreq: Add SEEP governor for hardware-managed P-states
config: arm64-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130652.MbID3V5Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130652.MbID3V5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130652.MbID3V5Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/acpi/cppc_acpi.h:17,
                    from drivers/cpufreq/cpufreq_seep.c:13:
>> include/acpi/processor.h:221:9: error: unknown type name 'phys_cpuid_t'
     221 |         phys_cpuid_t phys_id;   /* CPU hardware ID such as APIC ID for x86 */
         |         ^~~~~~~~~~~~
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
   Selected by [y]:
   - CPU_FREQ_GOV_SEEP [=y] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])


vim +/phys_cpuid_t +221 include/acpi/processor.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  217  
^1da177e4c3f415 Linus Torvalds    2005-04-16  218  struct acpi_processor {
^1da177e4c3f415 Linus Torvalds    2005-04-16  219  	acpi_handle handle;
^1da177e4c3f415 Linus Torvalds    2005-04-16  220  	u32 acpi_id;
828aef376d7a129 Catalin Marinas   2015-03-24 @221  	phys_cpuid_t phys_id;	/* CPU hardware ID such as APIC ID for x86 */
af8f3f514d193eb Hanjun Guo        2015-01-04  222  	u32 id;		/* CPU logical ID allocated by OS */
^1da177e4c3f415 Linus Torvalds    2005-04-16  223  	u32 pblk;
^1da177e4c3f415 Linus Torvalds    2005-04-16  224  	int performance_platform_limit;
01854e697a77a43 Luming Yu         2007-05-26  225  	int throttling_platform_limit;
ff55a9cebab0240 Len Brown         2007-06-02  226  	/* 0 - states 0..n-th state available */
01854e697a77a43 Luming Yu         2007-05-26  227  
^1da177e4c3f415 Linus Torvalds    2005-04-16  228  	struct acpi_processor_flags flags;
^1da177e4c3f415 Linus Torvalds    2005-04-16  229  	struct acpi_processor_power power;
^1da177e4c3f415 Linus Torvalds    2005-04-16  230  	struct acpi_processor_performance *performance;
^1da177e4c3f415 Linus Torvalds    2005-04-16  231  	struct acpi_processor_throttling throttling;
^1da177e4c3f415 Linus Torvalds    2005-04-16  232  	struct acpi_processor_limit limit;
d9460fd227ed2ce Zhang Rui         2008-01-17  233  	struct thermal_cooling_device *cdev;
ac212b6980d8d5e Rafael J. Wysocki 2013-05-03  234  	struct device *dev; /* Processor device. */
3000ce3c52f8b8d Rafael J. Wysocki 2019-10-16  235  	struct freq_qos_request perflib_req;
3000ce3c52f8b8d Rafael J. Wysocki 2019-10-16  236  	struct freq_qos_request thermal_req;
^1da177e4c3f415 Linus Torvalds    2005-04-16  237  };
^1da177e4c3f415 Linus Torvalds    2005-04-16  238  

:::::: The code at line 221 was first introduced by commit
:::::: 828aef376d7a129547bc4ebb949965040177e3da ACPI / processor: Introduce phys_cpuid_t for CPU hardware ID

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
