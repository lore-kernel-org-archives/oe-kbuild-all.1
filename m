Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B118018E047
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 19:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733168684; cv=none; b=UZhRx6zUoMy8lgocW7dW+U80eruAw3s3rcKZ65aGV4X2Sm9rW0IxFU6+T7pjbopm/KdVusCROdNLTxekgEdmkXb72TyReH1NM6jrOCwedqy1F6FJdHaULaKF3VV8bMzc6DBMowoxQTVt5zyZrgeQZIo6OI3y0C5Y++B9gujAijU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733168684; c=relaxed/simple;
	bh=+Q02md0P6p6/4XBiWEkmfWaIKe3LgOkZm4M0t2r1udk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHtcy+Q2h67Dv49sNpV6JXbYA3E/Z3D9CYBFgE7l7kI62IkIe3ajnWOEAxTvo9g530XZc5Mr/wmA+7feAaSRvMb5xs7cMsLzofSp1E+sMaqN0uPBCTPvWg1xcznTPoCFgiekNhtxaogO8x+proMSJjCLekfrB2/xLS6EjPFeLqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIyDdV5T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIyDdV5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733168680; x=1764704680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Q02md0P6p6/4XBiWEkmfWaIKe3LgOkZm4M0t2r1udk=;
  b=VIyDdV5Tdiy7kGOQGUO+kaebwUtanaPuOjiQfZ7ISPkBCjBUH2RQAsJW
   /u/5nCHjUcvWfAkhEy0++bVUHr/fm2tDHRNZccaS79RHJEvTYgI31ROkA
   0Eufr9ez/y5VFbPvvdk1m/FKUL69fUDJ8uCnxgNq5+ZgHqmdtTmUiOBYE
   Vu6C4WRCSrm6ImQ3lafeJBAZb/N9h06q/u8NzaDqzcH7pLyEVhPNkSSBq
   j5oiJsOr0GYqt/ovuIMjFv0/fQ4MREAJrNrq15AOnfXv+ziDI2QCkXjDk
   7z5ZZnfF3Zi+O5tG6uY0T0/mq1GF2LkAyYJswNWWmSt/NVBvIYsWIjsNb
   A==;
X-CSE-ConnectionGUID: cxFCtWWCSr2q7Y2lqa+Jsg==
X-CSE-MsgGUID: 7KOAKc30Rz6H05pCvQa71w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="58763072"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="58763072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 11:44:40 -0800
X-CSE-ConnectionGUID: 0xY2r86PSk2+newe6doE+Q==
X-CSE-MsgGUID: gK6f/OxeSEiHXo2nfVb4tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93603328"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2024 11:44:38 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tICKy-0002pf-07;
	Mon, 02 Dec 2024 19:44:14 +0000
Date: Tue, 3 Dec 2024 03:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:207:24:
 warning: passing argument 1 of 'iounmap' discards 'volatile' qualifier from
 pointer target type
Message-ID: <202412030318.lUO50DjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 0bbadafdc49d11a1836e5946f517d18cceaea6c8 um: allow disabling NO_IOMEM
date:   3 years, 6 months ago
config: um-randconfig-r061-20241113 (https://download.01.org/0day-ci/archive/20241203/202412030318.lUO50DjW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030318.lUO50DjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030318.lUO50DjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:76:15: warning: no previous prototype for '__wrap_devm_ioremap' [-Wmissing-prototypes]
      76 | void __iomem *__wrap_devm_ioremap(struct device *dev,
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:88:7: warning: no previous prototype for '__wrap_devm_memremap' [-Wmissing-prototypes]
      88 | void *__wrap_devm_memremap(struct device *dev, resource_size_t offset,
         |       ^~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:126:7: warning: no previous prototype for '__wrap_devm_memremap_pages' [-Wmissing-prototypes]
     126 | void *__wrap_devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:159:7: warning: no previous prototype for '__wrap_phys_to_pfn_t' [-Wmissing-prototypes]
     159 | pfn_t __wrap_phys_to_pfn_t(phys_addr_t addr, unsigned long flags)
         |       ^~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:169:7: warning: no previous prototype for '__wrap_memremap' [-Wmissing-prototypes]
     169 | void *__wrap_memremap(resource_size_t offset, size_t size,
         |       ^~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:180:6: warning: no previous prototype for '__wrap_devm_memunmap' [-Wmissing-prototypes]
     180 | void __wrap_devm_memunmap(struct device *dev, void *addr)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:190:15: warning: no previous prototype for '__wrap_ioremap' [-Wmissing-prototypes]
     190 | void __iomem *__wrap_ioremap(resource_size_t offset, unsigned long size)
         |               ^~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:196:15: warning: no previous prototype for '__wrap_ioremap_wc' [-Wmissing-prototypes]
     196 | void __iomem *__wrap_ioremap_wc(resource_size_t offset, unsigned long size)
         |               ^~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c: In function '__wrap_iounmap':
>> drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:207:24: warning: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     207 |         return iounmap(addr);
         |                        ^~~~
   In file included from include/linux/io.h:13,
                    from drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:13:
   arch/um/include/asm/io.h:13:42: note: expected 'void *' but argument is of type 'volatile void *'
      13 | static inline void iounmap(void __iomem *addr)
         |                            ~~~~~~~~~~~~~~^~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c: At top level:
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:211:6: warning: no previous prototype for '__wrap_memunmap' [-Wmissing-prototypes]
     211 | void __wrap_memunmap(void *addr)
         |      ^~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:347:18: warning: no previous prototype for '__wrap___request_region' [-Wmissing-prototypes]
     347 | struct resource *__wrap___request_region(struct resource *parent,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:355:5: warning: no previous prototype for '__wrap_insert_resource' [-Wmissing-prototypes]
     355 | int __wrap_insert_resource(struct resource *parent, struct resource *res)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:363:5: warning: no previous prototype for '__wrap_remove_resource' [-Wmissing-prototypes]
     363 | int __wrap_remove_resource(struct resource *res)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:371:18: warning: no previous prototype for '__wrap___devm_request_region' [-Wmissing-prototypes]
     371 | struct resource *__wrap___devm_request_region(struct device *dev,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:381:6: warning: no previous prototype for '__wrap___release_region' [-Wmissing-prototypes]
     381 | void __wrap___release_region(struct resource *parent, resource_size_t start,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:389:6: warning: no previous prototype for '__wrap___devm_release_region' [-Wmissing-prototypes]
     389 | void __wrap___devm_release_region(struct device *dev, struct resource *parent,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:397:13: warning: no previous prototype for '__wrap_acpi_evaluate_object' [-Wmissing-prototypes]
     397 | acpi_status __wrap_acpi_evaluate_object(acpi_handle handle, acpi_string path,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:413:21: warning: no previous prototype for '__wrap_acpi_evaluate_dsm' [-Wmissing-prototypes]
     413 | union acpi_object * __wrap_acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +207 drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c

32ab0a3f51701c Dan Williams 2015-08-01  189  
c1468554776229 Dan Williams 2019-11-13 @190  void __iomem *__wrap_ioremap(resource_size_t offset, unsigned long size)
c1468554776229 Dan Williams 2019-11-13  191  {
c1468554776229 Dan Williams 2019-11-13  192  	return __nfit_test_ioremap(offset, size, ioremap);
c1468554776229 Dan Williams 2019-11-13  193  }
c1468554776229 Dan Williams 2019-11-13  194  EXPORT_SYMBOL(__wrap_ioremap);
c1468554776229 Dan Williams 2019-11-13  195  
9d27a87ec9e131 Dan Williams 2015-07-10  196  void __iomem *__wrap_ioremap_wc(resource_size_t offset, unsigned long size)
9d27a87ec9e131 Dan Williams 2015-07-10  197  {
9d27a87ec9e131 Dan Williams 2015-07-10  198  	return __nfit_test_ioremap(offset, size, ioremap_wc);
9d27a87ec9e131 Dan Williams 2015-07-10  199  }
9d27a87ec9e131 Dan Williams 2015-07-10  200  EXPORT_SYMBOL(__wrap_ioremap_wc);
9d27a87ec9e131 Dan Williams 2015-07-10  201  
6bc756193ff61b Dan Williams 2015-06-17  202  void __wrap_iounmap(volatile void __iomem *addr)
6bc756193ff61b Dan Williams 2015-06-17  203  {
9bfa84969dd52b Dan Williams 2015-12-11  204  	struct nfit_test_resource *nfit_res = get_nfit_res((long) addr);
6bc756193ff61b Dan Williams 2015-06-17  205  	if (nfit_res)
6bc756193ff61b Dan Williams 2015-06-17  206  		return;
6bc756193ff61b Dan Williams 2015-06-17 @207  	return iounmap(addr);
6bc756193ff61b Dan Williams 2015-06-17  208  }
6bc756193ff61b Dan Williams 2015-06-17  209  EXPORT_SYMBOL(__wrap_iounmap);
6bc756193ff61b Dan Williams 2015-06-17  210  

:::::: The code at line 207 was first introduced by commit
:::::: 6bc756193ff61bf5e7b3cfedfbb0873bf40f8055 tools/testing/nvdimm: libnvdimm unit test infrastructure

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
