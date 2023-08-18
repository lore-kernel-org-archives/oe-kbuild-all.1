Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAFD624
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 05:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692335088; x=1723871088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GmWNOe6DPk3ELWgS78R3/2LpmCg7h07DxTeLynENprM=;
  b=ZCcz/i9XfpZTBGRxBAwQeycnu3EvEBNjyiAtNGhOMlj4TALYFn0wq0w2
   eXCDOleHu3gorTZ7XL4gG0hgBEuMCTDFWG8JxWqr1PP23L2MQzm/C/u3F
   7azLTk7651p3/vnI2c9YtpUwyZ4cSTls/ZFl8O/IkYvLTALhdto9h3Ufl
   Gd3Mh3Pp+RK28I3XEMfMwi28qGk/8zI9yBO7j/dSOTRTbS1e+DIyAUWkb
   KqXJg/Q/jW9EOewErllxXWMBKmzy9LKmtJOwgBDNm4JpC3OZfGC9WfQMx
   A+LmgEGfCUA/4qfCdeA/Fs5Ag31t2hBcrPloMLJiW5kL8v33EcbmES7Nr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357977163"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="357977163"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 22:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734959284"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="734959284"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 22:04:46 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWrf0-00027m-0o;
	Fri, 18 Aug 2023 05:04:40 +0000
Date: Fri, 18 Aug 2023 13:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 30/34] drivers/acpi/osl.c:410: warning:
 cannot understand function prototype: 'void *__ref
 acpi_os_map_memory_opregion(acpi_physical_address phys, acpi_size size) '
Message-ID: <202308181323.JIioRAcv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   f84bcdf50d1bb34ff2715bb067074582b407f3d9
commit: 7be70dd0f99a936b19893afa9b0719009181bd34 [30/34] acpica: add acpi_os_map_memory_opregion
config: loongarch-randconfig-l501-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181323.JIioRAcv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181323.JIioRAcv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181323.JIioRAcv-lkp@intel.com/

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
