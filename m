Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8314294
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLh0rDfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699007137; x=1730543137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7l5rCZEX9kIWIN4oWjPGSKf8wtOaAOv4Sz5pSRE+Ht0=;
  b=fLh0rDfbGiNE3N+QFTWeBsMGYPCnKeJGKCkv7hggAgDUv47Iw8SSWZAO
   xvVUqSjwEEZuOOLJB1IVdvSoyfKNVQfsBDKcau5HZAZOlFF03ZbvwN2nM
   tRGLrZewNNDHkOsfXBSDg0eaBOobLrUOHBPgbX0FmyzzT+beNQ7xBLmNT
   8N0BfMpjuQUwarX1HfWqXC1knHxTwCrnr4d58qXlz70mc7NkFUP/s0t99
   kh+PghLKbhO7pleXLKlFbnprCAWWnk+mTf1f5alaLT1J2wvzB/OB1KKyu
   2P/FDC9UJuyNrHQwVi2F8g3IIPr4e3QQQWWWze1PtS9cvEWNaGCoZuIdC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391790845"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="391790845"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 03:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="790718485"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="790718485"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2023 03:25:30 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyrMm-0002SV-0B;
	Fri, 03 Nov 2023 10:25:28 +0000
Date: Fri, 3 Nov 2023 18:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 30/34] drivers/acpi/osl.c:410: warning:
 cannot understand function prototype: 'void *__ref
 acpi_os_map_memory_opregion(acpi_physical_address phys, acpi_size size) '
Message-ID: <202311031808.BNcjeVsZ-lkp@intel.com>
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
config: i386-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231103/202311031808.BNcjeVsZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031808.BNcjeVsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031808.BNcjeVsZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/osl.c:410: warning: cannot understand function prototype: 'void *__ref acpi_os_map_memory_opregion(acpi_physical_address phys, acpi_size size) '


vim +410 drivers/acpi/osl.c

   391	
   392	/**
   393	 * acpi_os_map_memory_opregion - Get a virtual address for a given physical
   394	 * address range. This function is intended to be used only for AML operation
   395	 * regions. In a confidential computing guest such regions needs to be explicitly
   396	 * shared with the host to avoid breaking the communication. 
   397	 *
   398	 * @phys: Start of the physical address range to map.
   399	 * @size: Size of the physical address range to map.
   400	 *
   401	 * Look up the given physical address range in the list of existing ACPI memory
   402	 * mappings.  If found, get a reference to it and return a pointer to it (its
   403	 * virtual address).  If not found, map it, add it to that list and return a
   404	 * pointer to it.
   405	 *
   406	 * During early init (when acpi_permanent_mmap has not been set yet) this
   407	 * routine simply calls __acpi_map_table() to get the job done.
   408	 */
   409	void *__ref acpi_os_map_memory_opregion(acpi_physical_address phys, acpi_size size)
 > 410	{
   411		if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
   412			return (void *)__acpi_os_map_iomem(phys, size, false);
   413		else
   414			return (void *)__acpi_os_map_iomem(phys, size, true);
   415	}
   416	EXPORT_SYMBOL_GPL(acpi_os_map_memory_opregion);
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
