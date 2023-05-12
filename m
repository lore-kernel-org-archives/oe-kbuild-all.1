Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C6261DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683925265; x=1715461265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5uG4AtUH5+sMlmHVzujie4mHI3ti9XIv5A7kd+b+2c=;
  b=I80kCiILkkcX+ODayHZc/4ODH7725ZSZUTjIwfOgkQCTsyqtAdNtOCWr
   QCbu3iuftZgC7aofV0LzfYk5DEKsLbLxwP7BYrlt78RgcBrVtd2aLeU+T
   WfojTZ1Hv/FvTtvFVhj1hPaH+VT9yFzwhx7Q2DCCp5jJ/qj3s3kbHza7J
   CP82WyFxM6I+ph1UzFhaucV6SDxeu6ZjMv4cUvIpEX0DhyyvjrBqm6W89
   +H/J0b8k7bAlfxBXEUvdz2Px/8I5rrdcYX5TAE0fGaWcEOTuEq4YVtZtn
   7uhkfvCs5rHhwAEgxvrEmKmeNrn4HhGGevlDZnbSFa2kFTVfIyMEBcoPM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="348375818"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="348375818"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 14:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="874518407"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="874518407"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 May 2023 14:00:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxZsm-00056o-0C;
	Fri, 12 May 2023 21:00:56 +0000
Date: Sat, 13 May 2023 05:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 30/33] drivers/acpi/osl.c:382:17: sparse:
 sparse: incorrect type in return expression (different address spaces)
Message-ID: <202305130425.jbtq1nuf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   b143cfba688689945ae56d38a6f76100859b5025
commit: 70b3d5760c1b65e6c5a1920e8231089f01aff9d6 [30/33] acpica: add acpi_os_map_memory_opregion
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230513/202305130425.jbtq1nuf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/70b3d5760c1b65e6c5a1920e8231089f01aff9d6
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter
        git checkout 70b3d5760c1b65e6c5a1920e8231089f01aff9d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130425.jbtq1nuf-lkp@intel.com/

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
https://github.com/intel/lkp-tests
