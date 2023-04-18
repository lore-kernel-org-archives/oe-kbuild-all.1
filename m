Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67100290E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681824169; x=1713360169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6a4IiwWJ0M+r6OeTYmT8sPp/x0yypSfelETmSY6o1U=;
  b=oKleFKy0SK3q/mo4GKhywosnH7G/Bu984IqP9QN3hgtpa7CwwEiHahlG
   frA13+G70HhHVY+XBIQh21nDVhv97LCxBFdyAt2IyyakQfVKSOvbleUpI
   kFu4+yHKSs16Y/jB03ml2veo1e4kzduOWivI2M2zaUs3qvYoSEVYWFLT0
   Yv/LmMlwJ4+7tjyuFw886lVoxI8q+sBqLLHLvYdrU1qjKiz1rvOTLfATF
   37U6mQ0Z60XhmNJ4G/LZJSg2lePPL5R0OI4QhZzcQ2tslsV2XbfGUVXmo
   IzFXdPgg6y6o3SbS4TIPCvIzz0OJKQc4erExCYMq9Edjc6kzbztO5o8Gw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="408066856"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="408066856"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 06:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="834883635"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="834883635"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 06:22:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1polIC-000dX0-2S;
	Tue, 18 Apr 2023 13:22:44 +0000
Date: Tue, 18 Apr 2023 21:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 31/34] drivers/acpi/osl.c:382:17:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202304182137.u98MdVfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   4477b3ca50dc123f8b956d82b7d970d2c20261e6
commit: 7d73ac652a3a55e6668e0a6df6c7eb489e4880ec [31/34] acpica: add acpi_os_map_memory_opregion
config: ia64-randconfig-s043-20230417 (https://download.01.org/0day-ci/archive/20230418/202304182137.u98MdVfb-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/7d73ac652a3a55e6668e0a6df6c7eb489e4880ec
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 7d73ac652a3a55e6668e0a6df6c7eb489e4880ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304182137.u98MdVfb-lkp@intel.com/

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
