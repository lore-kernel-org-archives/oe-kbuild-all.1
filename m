Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1E353A61
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 20:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963351; cv=none; b=HGLaAM1kjbN7vBSUxltg9hVK1BHsaghNgBsefvgkxn8U/9eKfeXSw6CktlnQv+YFXLLYM3hM7fKrR9C6BILgV5YbY0hKXj+Ynt3W9oqJ91/e0bD9XIAAgQCptdJg30te0u4qMrzXgi3Qv+Pagh+qhmb0uDKYGTCWKGr+KaQyPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963351; c=relaxed/simple;
	bh=luot0K22JFjUWO2a8rpMR2DsqZTLdGprRoFcwLMPDT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=noXx88MXS4gjSk/OEDEo+DBRcWw22SSHpRdMu6OuN73oTQtks6no+M7OckLs7aQ9MqpX5RBiczHqCJw0pMO20npjzlNQkuQudn23UhBOXCD1AzAt1+jm89iH2AmzwHFP28L/vQ34+3f86DY1oTxW0QTxjk/JQdUyuF+2j0aifsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU1lBs7U; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU1lBs7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785963350; x=1817499350;
  h=date:from:to:cc:subject:message-id;
  bh=luot0K22JFjUWO2a8rpMR2DsqZTLdGprRoFcwLMPDT0=;
  b=UU1lBs7UJ2KtLFHdCxV6/hm0DOmbdnRXRddc2udd0LO0yxP4G//5JIz8
   9mvvhoHfnqDze30R8TSSFkw49Mbx9zI4ERfjdWy2BADUbIu4fQYuhlZLp
   dWeVASFakZ/b6QQmCJPotDaHXhAIT33gEmNEVknzE9TehwPvaKfn/AF6c
   +tQLgnz0kzmJNnCGzHhsuc767yyq92W19jd+gf63HTsp0qaWolD/qw9en
   lzumelGFOo5U799wrQC/3QE67b70YmVsffspOJgw/avNtF9edb1I4lhBg
   GdJXvCjzMSSGQEJfL0YLRDv0o2UV/G9aXoNvFjoG4qAvDgvyNLvAEUWMr
   Q==;
X-CSE-ConnectionGUID: CRd1tpeOTsWl4wzpbcej4Q==
X-CSE-MsgGUID: krXbZahoSHadoxaCaIi27g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86491103"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86491103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 13:55:49 -0700
X-CSE-ConnectionGUID: sjyg4/x3Qnejn7u3RXI6gQ==
X-CSE-MsgGUID: q9PmXndAS7C1L84ORqvGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="300134364"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2026 13:55:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrieP-00000000DQb-1vj9;
	Wed, 05 Aug 2026 20:55:45 +0000
Date: Thu, 06 Aug 2026 04:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/proc/vmcore.c:424:19:
 warning: 'mmap_vmcore_fault' defined but not used
Message-ID: <202608060428.bNAXVSS2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cf8ba5678385b2b8832ed2e87c035925eb12bc4a
commit: 5b548fd0d2981f8ae80b7f07019d83d3536ba13f [1/1] fs/proc: fix compile warning about variable 'vmcore_mmap_ops'
config: arm-randconfig-r051-20260806 (https://download.01.org/0day-ci/archive/20260806/202608060428.bNAXVSS2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060428.bNAXVSS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060428.bNAXVSS2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/vmcore.c:424:19: warning: 'mmap_vmcore_fault' defined but not used [-Wunused-function]
    static vm_fault_t mmap_vmcore_fault(struct vm_fault *vmf)
                      ^~~~~~~~~~~~~~~~~


vim +/mmap_vmcore_fault +424 fs/proc/vmcore.c

9cb218131de1c5 Michael Holzheu         2013-09-11  416  
9cb218131de1c5 Michael Holzheu         2013-09-11  417  /*
9cb218131de1c5 Michael Holzheu         2013-09-11  418   * The vmcore fault handler uses the page cache and fills data using the
4a22fd20379ca8 Matthew Wilcox (Oracle  2022-04-29  419)  * standard __read_vmcore() function.
9cb218131de1c5 Michael Holzheu         2013-09-11  420   *
9cb218131de1c5 Michael Holzheu         2013-09-11  421   * On s390 the fault handler is used for memory regions that can't be mapped
9cb218131de1c5 Michael Holzheu         2013-09-11  422   * directly with remap_pfn_range().
9cb218131de1c5 Michael Holzheu         2013-09-11  423   */
36f062042b0fd9 Souptick Joarder        2018-08-21 @424  static vm_fault_t mmap_vmcore_fault(struct vm_fault *vmf)
9cb218131de1c5 Michael Holzheu         2013-09-11  425  {
9cb218131de1c5 Michael Holzheu         2013-09-11  426  #ifdef CONFIG_S390
11bac80004499e Dave Jiang              2017-02-24  427  	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
9cb218131de1c5 Michael Holzheu         2013-09-11  428  	pgoff_t index = vmf->pgoff;
4a22fd20379ca8 Matthew Wilcox (Oracle  2022-04-29  429) 	struct iov_iter iter;
4a22fd20379ca8 Matthew Wilcox (Oracle  2022-04-29  430) 	struct kvec kvec;
9cb218131de1c5 Michael Holzheu         2013-09-11  431  	struct page *page;
9cb218131de1c5 Michael Holzheu         2013-09-11  432  	loff_t offset;
9cb218131de1c5 Michael Holzheu         2013-09-11  433  	int rc;
9cb218131de1c5 Michael Holzheu         2013-09-11  434  
9cb218131de1c5 Michael Holzheu         2013-09-11  435  	page = find_or_create_page(mapping, index, GFP_KERNEL);
9cb218131de1c5 Michael Holzheu         2013-09-11  436  	if (!page)
9cb218131de1c5 Michael Holzheu         2013-09-11  437  		return VM_FAULT_OOM;
9cb218131de1c5 Michael Holzheu         2013-09-11  438  	if (!PageUptodate(page)) {
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  439  		offset = (loff_t) index << PAGE_SHIFT;
4a22fd20379ca8 Matthew Wilcox (Oracle  2022-04-29  440) 		kvec.iov_base = page_address(page);
4a22fd20379ca8 Matthew Wilcox (Oracle  2022-04-29  441) 		kvec.iov_len = PAGE_SIZE;
de4eda9de2d957 Al Viro                 2022-09-15  442  		iov_iter_kvec(&iter, ITER_DEST, &kvec, 1, PAGE_SIZE);
4a22fd20379ca8 Matthew Wilcox (Oracle  2022-04-29  443) 
4a22fd20379ca8 Matthew Wilcox (Oracle  2022-04-29  444) 		rc = __read_vmcore(&iter, &offset);
9cb218131de1c5 Michael Holzheu         2013-09-11  445  		if (rc < 0) {
9cb218131de1c5 Michael Holzheu         2013-09-11  446  			unlock_page(page);
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  447  			put_page(page);
b5c212374c8535 Souptick Joarder        2018-10-30  448  			return vmf_error(rc);
9cb218131de1c5 Michael Holzheu         2013-09-11  449  		}
9cb218131de1c5 Michael Holzheu         2013-09-11  450  		SetPageUptodate(page);
9cb218131de1c5 Michael Holzheu         2013-09-11  451  	}
9cb218131de1c5 Michael Holzheu         2013-09-11  452  	unlock_page(page);
9cb218131de1c5 Michael Holzheu         2013-09-11  453  	vmf->page = page;
9cb218131de1c5 Michael Holzheu         2013-09-11  454  	return 0;
9cb218131de1c5 Michael Holzheu         2013-09-11  455  #else
9cb218131de1c5 Michael Holzheu         2013-09-11  456  	return VM_FAULT_SIGBUS;
9cb218131de1c5 Michael Holzheu         2013-09-11  457  #endif
9cb218131de1c5 Michael Holzheu         2013-09-11  458  }
9cb218131de1c5 Michael Holzheu         2013-09-11  459  

:::::: The code at line 424 was first introduced by commit
:::::: 36f062042b0fd9f8e41b97a472f52139886ca26f fs/proc/vmcore.c: use new typedef vm_fault_t

:::::: TO: Souptick Joarder <jrdr.linux@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
