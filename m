Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B19818
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695501651; x=1727037651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBPmmrkb5v5mtVOBzT08mDmIia8sMXhxSwVaCxoav4w=;
  b=lhyes1KsYinQlpcqtU5FUNh9kLkuwaFd3OmuWbYpulqRATS0CpvTyUij
   WtEdDgXQ+/XrE4Njcq69iaUNieClrJEs1EVssqhAGgwvczVRn4w8uz2ML
   HtDCFgTNQyFe3jWYuokvn0mRY7rX/b39uPZZI0OEVAxHr3BeYb7ozw8g/
   uW9ubVpzXdMCahQDFRKIqpz9DIw0qt0SG2aybbIwsh4dqwMKdrs/5v+wn
   f8gTv+TdnCS4RJNWFPBPmbCfx3SaQicH9kn/HgTZ0JNbOaZGfdZOvQ33X
   PW4uDi6l8xeej7J65oeT1CG9I8/lMAkMBUCgRG9Luf9Mg8l7+2oM7Sb4Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="366114553"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="366114553"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 13:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="747927118"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="747927118"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Sep 2023 13:40:49 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk9Ql-0002pX-1Q;
	Sat, 23 Sep 2023 20:40:47 +0000
Date: Sun, 24 Sep 2023 04:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 17/34] arch/parisc/include/asm/io.h:139:23:
 error: 'addr' undeclared
Message-ID: <202309240414.RxIDRMGr-lkp@intel.com>
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
commit: d80f2db5351d606316f8d9f3cd29d3e76fad255b [17/34] iomap: Mark ioremap shared when the device is authorized
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230924/202309240414.RxIDRMGr-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240414.RxIDRMGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240414.RxIDRMGr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from lib/pci_iomap.c:7:
   lib/pci_iomap.c: In function 'pci_iomap_range':
>> arch/parisc/include/asm/io.h:139:23: error: 'addr' undeclared (first use in this function)
     139 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |                       ^~~~
   lib/pci_iomap.c:47:32: note: in expansion of macro 'ioremap_driver_hardened'
      47 |                         return ioremap_driver_hardened(start, len);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/parisc/include/asm/io.h:139:23: note: each undeclared identifier is reported only once for each function it appears in
     139 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |                       ^~~~
   lib/pci_iomap.c:47:32: note: in expansion of macro 'ioremap_driver_hardened'
      47 |                         return ioremap_driver_hardened(start, len);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/parisc/include/asm/io.h:139:31: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     139 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |                               ^~~~
   lib/pci_iomap.c:47:32: note: in expansion of macro 'ioremap_driver_hardened'
      47 |                         return ioremap_driver_hardened(start, len);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~


vim +/addr +139 arch/parisc/include/asm/io.h

426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  129  
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  130  #define _PAGE_IOREMAP (_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | \
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  131  		       _PAGE_ACCESSED | _PAGE_NO_CACHE)
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  132  
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  133  #define ioremap_wc(addr, size)  \
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  134  	ioremap_prot((addr), (size), _PAGE_IOREMAP)
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  135  #define ioremap_uc(addr, size)  \
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  136  	ioremap_prot((addr), (size), _PAGE_IOREMAP)
6ecf3c252b954b arch/parisc/include/asm/io.h Andi Kleen     2021-10-20  137  /* Share memory with host in confidential guest platforms */
6ecf3c252b954b arch/parisc/include/asm/io.h Andi Kleen     2021-10-20  138  #define ioremap_driver_hardened \
6ecf3c252b954b arch/parisc/include/asm/io.h Andi Kleen     2021-10-20 @139  	ioremap_prot((addr), (size), _PAGE_IOREMAP)
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  140  

:::::: The code at line 139 was first introduced by commit
:::::: 6ecf3c252b954ba96df36a6f2be4ea3c83f23c7d asm/io.h: Add ioremap_driver_hardening

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
