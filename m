Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEC7EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 02:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689303381; x=1720839381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOGtwmMyfpuGqcOOr9yqXLyDUNOaT1Po8tUCknevqig=;
  b=Z+THrG9gb+DjcF4kr5/CWnEvw7PX0Ri8fB7xzQvFh73OtWf8OU5GUZYI
   67L1G2ueUj9uka7o4mP6Dk6UltssvFP8kKqm1r6g1TJRx2d3fLMHxeMyG
   R0pGvot78jDEIiJldfrhMxCuE1l8+94OqFl9NEPyni3dJbvXE+r9tRMtL
   b0QMmU32VMHLY9z8upKN76kO+eXOE/AoMTm+F/eX3GOSodXO91eqBtPs/
   XFUCjOR65yo1uxrEzRbe0erOxfd/4QFSHPI1K7qrNXXCyrAXcV5XjizYz
   +sQv9VX7/3zDwT5QipIjo+L07WXn7pPDvRIbbC4/3bpBBwjQaAQkvxZSi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365414363"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="365414363"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 19:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968854736"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="968854736"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2023 19:56:19 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK8yh-000775-0p;
	Fri, 14 Jul 2023 02:56:19 +0000
Date: Fri, 14 Jul 2023 10:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 30/33] drivers/acpi/osl.c:382:17: sparse:
 sparse: incorrect type in return expression (different address spaces)
Message-ID: <202307141058.uEsXKZ1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   d267897a41f3e84fa722fef42f2802c105c4c98d
commit: 7be70dd0f99a936b19893afa9b0719009181bd34 [30/33] acpica: add acpi_os_map_memory_opregion
config: x86_64-randconfig-r083-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141058.uEsXKZ1I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141058.uEsXKZ1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141058.uEsXKZ1I-lkp@intel.com/

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
