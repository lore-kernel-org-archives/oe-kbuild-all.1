Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F0028E39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694707949; x=1726243949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TYgMEYxReAC6AB2IustZsyA1oeDXfZs6eOEjSnhGS3s=;
  b=g+lL8hmct50xlrKiuyn30/oncHmdkqxu5w7ViJYJNWrd3+QAM9E4qwHB
   yTWLrSRHgZJBK770EXjNzBWxYUQhuzSsiBgBF8+yUlU0wRz1GZUzyt6CW
   9WRqH58LBJWFy9ACJUjpfvSOy9aJwatvlWo1uKaLTjNtMAn2A+PlNPD3h
   U3UJIhPNshoj5wDvxLiKCPpVuv539GrABLwfHsW4V9yLIchGlPohCx7DX
   lmdpqpBtbHs9inMGP3Lu67Q2X6Rn8g9k+DN0HlcQ8mqZaUtbiajIzalRL
   bRg/2u2DeIGwJviIKWzf52+oi1FOHzSf86rzLrkIzPBxqs3Zl/x5XgWiJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381713901"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="381713901"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 09:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="810135065"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="810135065"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Sep 2023 09:11:31 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgowD-0001nd-0E;
	Thu, 14 Sep 2023 16:11:29 +0000
Date: Fri, 15 Sep 2023 00:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 30/34] drivers/acpi/osl.c:382:17: sparse:
 sparse: incorrect type in return expression (different address spaces)
Message-ID: <202309150026.TlHY7mRx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   205bbdcce0e2be471018d939d81dae51d63b5bd5
commit: 5bad3b6e79c1f4036a7ae6b3699dadb2635e8717 [30/34] acpica: add acpi_os_map_memory_opregion
config: i386-randconfig-063-20230914 (https://download.01.org/0day-ci/archive/20230915/202309150026.TlHY7mRx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150026.TlHY7mRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150026.TlHY7mRx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/acpi/osl.c:382:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/acpi/osl.c:382:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/acpi/osl.c:382:17: sparse:     expected void [noderef] __iomem *
   drivers/acpi/osl.c:382:17: sparse:     got void *
   drivers/acpi/osl.c:388:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/acpi/osl.c:412:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/acpi/osl.c:414:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/acpi/osl.c:1717:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *rv @@     got void [noderef] __iomem * @@
   drivers/acpi/osl.c:1717:20: sparse:     expected void *rv
   drivers/acpi/osl.c:1717:20: sparse:     got void [noderef] __iomem *
   drivers/acpi/osl.c:747:1: sparse: sparse: context imbalance in 'acpi_os_read_memory' - wrong count at exit
   drivers/acpi/osl.c:780:1: sparse: sparse: context imbalance in 'acpi_os_write_memory' - wrong count at exit

vim +382 drivers/acpi/osl.c

   365	
   366	/**
   367	 * acpi_os_map_iomem - Get a virtual address for a given physical address range.
   368	 * @phys: Start of the physical address range to map.
   369	 * @size: Size of the physical address range to map.
   370	 *
   371	 * Look up the given physical address range in the list of existing ACPI memory
   372	 * mappings.  If found, get a reference to it and return a pointer to it (its
   373	 * virtual address).  If not found, map it, add it to that list and return a
   374	 * pointer to it.
   375	 *
   376	 * During early init (when acpi_permanent_mmap has not been set yet) this
   377	 * routine simply calls __acpi_map_table() to get the job done.
   378	 */
   379	void __iomem __ref
   380	*acpi_os_map_iomem(acpi_physical_address phys, acpi_size size)
   381	{
 > 382		return (void *)__acpi_os_map_iomem(phys, size, false);
   383	}
   384	EXPORT_SYMBOL_GPL(acpi_os_map_iomem);
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
