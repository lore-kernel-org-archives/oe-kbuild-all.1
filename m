Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55F378
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 16:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693932642; x=1725468642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gbLcVPinYyWvw3Hz2yndjFJmwU1wyR4blU8WbVUGCvI=;
  b=iXUBZycyIB07/2x+dMbU0wxZjFoCRV/C0DfrihrdL1JLBidNgn7bzVpC
   e+sc481CmD471AZHLIKnwwXSfHBpAkyjEGEF8Sh6ysYJm27XonHGsKB6I
   SJVagTsxlcMQTbzp3HU0Dr9kuMDvgJjXKcogq+9FyrFNJbWLxIUoA1lTE
   lThETzbIlv8UHj5SFYLrKMO6YZFaRYhuKt0pgTWSz/FOlnW1uPne8ES4Y
   YZQeqfFMsfLB2Bnfx0ggcSSurQAv2hPqj2wouvv4WgmLapSNLcejQdyYi
   G3JnofLqMuW1omPoD86gnsbckm/Afup863phuY0wPtXRsem2ZQfhZJ2dc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="356335453"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="356335453"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 09:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="741151427"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="741151427"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Sep 2023 09:50:37 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdZG6-0001sR-2K;
	Tue, 05 Sep 2023 16:50:34 +0000
Date: Wed, 6 Sep 2023 00:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/firmware/efi/libstub/alignedmem.c:27: warning: Function
 parameter or member 'memory_type' not described in
 'efi_allocate_pages_aligned'
Message-ID: <202309060040.oB844fn2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f86ed6ec0b390c033eae7f9c487a3fea268e027
commit: 9cf42bca30e98a1c6c9e8abf876940a551eaa3d1 efi: libstub: use EFI_LOADER_CODE region when moving the kernel in memory
date:   10 months ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230906/202309060040.oB844fn2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060040.oB844fn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060040.oB844fn2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/alignedmem.c:27: warning: Function parameter or member 'memory_type' not described in 'efi_allocate_pages_aligned'


vim +27 drivers/firmware/efi/libstub/alignedmem.c

43b1df0e013c25 Ard Biesheuvel 2020-03-27   7  
43b1df0e013c25 Ard Biesheuvel 2020-03-27   8  /**
43b1df0e013c25 Ard Biesheuvel 2020-03-27   9   * efi_allocate_pages_aligned() - Allocate memory pages
43b1df0e013c25 Ard Biesheuvel 2020-03-27  10   * @size:	minimum number of bytes to allocate
43b1df0e013c25 Ard Biesheuvel 2020-03-27  11   * @addr:	On return the address of the first allocated page. The first
43b1df0e013c25 Ard Biesheuvel 2020-03-27  12   *		allocated page has alignment EFI_ALLOC_ALIGN which is an
43b1df0e013c25 Ard Biesheuvel 2020-03-27  13   *		architecture dependent multiple of the page size.
43b1df0e013c25 Ard Biesheuvel 2020-03-27  14   * @max:	the address that the last allocated memory page shall not
43b1df0e013c25 Ard Biesheuvel 2020-03-27  15   *		exceed
43b1df0e013c25 Ard Biesheuvel 2020-03-27  16   * @align:	minimum alignment of the base of the allocation
43b1df0e013c25 Ard Biesheuvel 2020-03-27  17   *
43b1df0e013c25 Ard Biesheuvel 2020-03-27  18   * Allocate pages as EFI_LOADER_DATA. The allocated pages are aligned according
43b1df0e013c25 Ard Biesheuvel 2020-03-27  19   * to @align, which should be >= EFI_ALLOC_ALIGN. The last allocated page will
43b1df0e013c25 Ard Biesheuvel 2020-03-27  20   * not exceed the address given by @max.
43b1df0e013c25 Ard Biesheuvel 2020-03-27  21   *
43b1df0e013c25 Ard Biesheuvel 2020-03-27  22   * Return:	status code
43b1df0e013c25 Ard Biesheuvel 2020-03-27  23   */
43b1df0e013c25 Ard Biesheuvel 2020-03-27  24  efi_status_t efi_allocate_pages_aligned(unsigned long size, unsigned long *addr,
9cf42bca30e98a Ard Biesheuvel 2022-08-02  25  					unsigned long max, unsigned long align,
9cf42bca30e98a Ard Biesheuvel 2022-08-02  26  					int memory_type)
43b1df0e013c25 Ard Biesheuvel 2020-03-27 @27  {

:::::: The code at line 27 was first introduced by commit
:::::: 43b1df0e013c25abb536699f46d0e9f291b586a0 efi/libstub: Add API function to allocate aligned memory

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
