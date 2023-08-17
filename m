Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7A914AA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692281081; x=1723817081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q2oPBcPCOcbDb80I+Q8C7q8UEzQrIeUnHlIFkRLbMJE=;
  b=OUHq3okgqFQ+IYVf43IJCYwYaBI5899pAzVTPYHusy3wA0uN3QKzFjPL
   7LrP+b4FnQyuk94lR2UTQA9rKAnX6DIHp0Mq9t/IqUTkMFta45El/XBQB
   fmvZMFZn9PPKfujQvtD5pp98P/YOEOh3xKXCjf8kP4unbEdO+4+MYgajp
   T4BAXbHYNwQmn44a5QKu40v9OSRiaaL73eWZrpCN34Y0YoSbD8+Zh5M/W
   RC7LGx4DO90qSLQm2gYGlyEcSSK1h7EAjO6ba8QanfafUbQD+IaU+LDYC
   9pHpHtdlqQMdB364on5KJ/am4kTF0NzV3pxfFEcsvs5GQUD9NN09GBsOG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439185924"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439185924"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 06:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824633291"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="824633291"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 06:28:58 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWd3T-0001AH-3A;
	Thu, 17 Aug 2023 13:28:53 +0000
Date: Thu, 17 Aug 2023 21:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/firmware/efi/libstub/alignedmem.c:27: warning: Function
 parameter or member 'memory_type' not described in
 'efi_allocate_pages_aligned'
Message-ID: <202308172116.yPoBelLU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 9cf42bca30e98a1c6c9e8abf876940a551eaa3d1 efi: libstub: use EFI_LOADER_CODE region when moving the kernel in memory
date:   9 months ago
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230817/202308172116.yPoBelLU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172116.yPoBelLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172116.yPoBelLU-lkp@intel.com/

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
