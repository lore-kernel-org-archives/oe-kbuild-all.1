Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DAC53B9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBLII8fX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929624; x=1730465624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TokO1a1gQUVjr7omcNoacvmt9abxm13g0VekgGWHAvQ=;
  b=dBLII8fXPFI7N6NIqu70nJvDlJKNJLhxNZ54A4y3Wia1DNvNR4TC5UXa
   aS+hTt5pY2ui8KWnyWkYhGuXNVG0kBjNfxUU0VnTAEfDqzvkkEzFFNg6o
   3ZUZ1wS8++Cm3QA4p9rsde8gfMOA9HZsDJXNZLoNmX+3bYwS6zsHfwsTR
   ABtTqF+N/5EHE01ekSnV2VEajqcgkmGDzrE424jrGKCggxJHE2kPRw1Mh
   6FOKxFeLFOlzcacJIr75YmOynUrnA8Xx0NySnZ2iLeRiICLPOHfMnY97n
   iwJigHqYav/B/SL13vzlzRwuwebnGWBQor6qL8v9W/qFrhx8PB0pkEhU7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="387580818"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="387580818"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="796224747"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="796224747"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Nov 2023 05:53:41 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyXCd-0001Sa-0I;
	Thu, 02 Nov 2023 12:53:39 +0000
Date: Thu, 2 Nov 2023 20:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 29/34] arch/parisc/include/asm/io.h:144:22:
 warning: passing argument 1 of 'ioremap_prot' makes integer from pointer
 without a cast
Message-ID: <202311022027.WXoXFJu0-lkp@intel.com>
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
commit: 7fe4861d7a94daeee2570ca50343ce449cf8f19c [29/34] asm/io.h: Add ioremap_cache_shared
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20231102/202311022027.WXoXFJu0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311022027.WXoXFJu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311022027.WXoXFJu0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from lib/devres.c:3:
   arch/parisc/include/asm/io.h:143: warning: "ioremap_uc" redefined
     143 | #define ioremap_uc \
         | 
   arch/parisc/include/asm/io.h:135: note: this is the location of the previous definition
     135 | #define ioremap_uc(addr, size)  \
         | 
   lib/devres.c: In function '__devm_ioremap':
>> arch/parisc/include/asm/io.h:144:22: warning: passing argument 1 of 'ioremap_prot' makes integer from pointer without a cast [-Wint-conversion]
     144 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |                      ^~~~~~
         |                      |
         |                      void *
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~
   In file included from arch/parisc/include/asm/io.h:286:
   include/asm-generic/io.h:1053:40: note: expected 'phys_addr_t' {aka 'unsigned int'} but argument is of type 'void *'
    1053 | void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
         |                            ~~~~~~~~~~~~^~~~~~~~~
   arch/parisc/include/asm/io.h:128:22: error: called object is not a function or function pointer
     128 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/parisc/include/asm/io.h:144:9: note: in expansion of macro 'ioremap_prot'
     144 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |         ^~~~~~~~~~~~
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~


vim +/ioremap_prot +144 arch/parisc/include/asm/io.h

   129	
   130	#define _PAGE_IOREMAP (_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | \
   131			       _PAGE_ACCESSED | _PAGE_NO_CACHE)
   132	
   133	#define ioremap_wc(addr, size)  \
   134		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   135	#define ioremap_uc(addr, size)  \
   136		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   137	/* Share memory with host in confidential guest platforms */
   138	#define ioremap_driver_hardened \
   139		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   140	/* Share memory with host in confidential guest platforms (WB version) */
   141	#define ioremap_cache_shared \
   142		ioremap_prot((addr), (size), _PAGE_IOREMAP)
 > 143	#define ioremap_uc \
 > 144		ioremap_prot((addr), (size), _PAGE_IOREMAP)
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
