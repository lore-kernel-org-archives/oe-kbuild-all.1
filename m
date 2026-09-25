Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B146C842
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337299; cv=none; b=hDcB/kF1BYFN8AFjYwcx09ipuCNSxw/9HB49lmXrxMOUAMN/lDXgo7907ZNNb0wg33GPQPZuFGj7Wj90+VnS7AB5o4gQKtTMlfmFuwf2o0tzR42swFg28lzZoKbWOsFvc6UhsopES3mIS9j9PwSKU9iM/7WZZ+5lPqVGJCeZrFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337299; c=relaxed/simple;
	bh=IX8jwQkhKnzBl3lc3EBKxEjH9Zz9mw/MBYubeKuyIgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=akxiWPVkyIcJyxwaKirhSzUXfhPBwXnL6Pu72Bhsd5fzooRnkIFp+mEP81LTLfBI9Jw/ThLj0ACFUBZUy2Bx61tq1WlzC0ZNFuJxhO/T6pul4RMxusuQP2tmBCvykAL03g/j+ee7OtPLbLVbJ/jz+S6xBt5M/kyeeUb/BzPPS8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlG4tGmS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlG4tGmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790337297; x=1821873297;
  h=date:from:to:cc:subject:message-id;
  bh=IX8jwQkhKnzBl3lc3EBKxEjH9Zz9mw/MBYubeKuyIgo=;
  b=HlG4tGmSOJ0gECIuLon/FTiHn0zipF3tWeucDAm/ez0PDlXhmau14sjy
   HItaGxhvptoVhTaXBqIh5IbhkcwSVAjd9clwLyqNnu2i1K0Cds4Zvlx2D
   eqD5JmWb1AHpdS9QS6kzbaoNBc7dEG0CVVR9wATsxNc+di/Q7H72iQgsJ
   PjhlesfZ4HwslW3Ngv+UvNpBayuGDoZPZYIs6C/UIYfB8A9UPgFJ6mjhm
   UKQXzlSJsf7KFS1CJi2VP0dJyGMsJpelCYn73azUJvIcWGcYWDHmM2JRv
   vdK18FFWetlD3RxnWc6ibFqx37lUdL25XHPiNv5RT8ZZY8ynQipJazJ+P
   g==;
X-CSE-ConnectionGUID: 7pflWqS2RryoGQYFRrahHA==
X-CSE-MsgGUID: u0H2EPDyR2e4Z2rMsN029g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89890100"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="89890100"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:54:56 -0700
X-CSE-ConnectionGUID: WUTiebKGTfeq5WT/14hgPw==
X-CSE-MsgGUID: exPl07fvTL2YI3mCZzMeaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273548440"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 04:54:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA4Vw-00000000KX8-2T3q;
	Fri, 25 Sep 2026 11:54:52 +0000
Date: Fri, 25 Sep 2026 19:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 426/673]
 arch/arc/include/asm/io.h:26:17: error: conflicting types for 'iounmap'; have
 'void(volatile void *)'
Message-ID: <202609251918.knKJVEed-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 34a7b291ebc9fbf0074ef62ba0bdc12fd356c2b1 [426/673] mmio: remove extraneous 'volatile' annotations'
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609251918.knKJVEed-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251918.knKJVEed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251918.knKJVEed-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from arch/arc/mm/ioremap.c:9:
>> arch/arc/include/asm/io.h:26:17: error: conflicting types for 'iounmap'; have 'void(volatile void *)'
      26 | #define iounmap iounmap
         |                 ^~~~~~~
   arch/arc/mm/ioremap.c:54:6: note: in expansion of macro 'iounmap'
      54 | void iounmap(volatile void __iomem *addr)
         |      ^~~~~~~
   arch/arc/include/asm/io.h:26:17: note: previous declaration of 'iounmap' with type 'void(void *)'
      26 | #define iounmap iounmap
         |                 ^~~~~~~
   include/asm-generic/io.h:1125:6: note: in expansion of macro 'iounmap'
    1125 | void iounmap(void __iomem *addr);
         |      ^~~~~~~
   arch/arc/mm/ioremap.c: In function 'iounmap':
>> arch/arc/mm/ioremap.c:60:25: warning: passing argument 1 of 'generic_iounmap' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
      60 |         generic_iounmap(addr);
         |                         ^~~~
   In file included from arch/arc/include/asm/io.h:229:
   include/asm-generic/io.h:1126:36: note: expected 'void *' but argument is of type 'volatile void *'
    1126 | void generic_iounmap(void __iomem *addr);
         |                      ~~~~~~~~~~~~~~^~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/vmalloc.h:5,
                    from arch/arc/mm/ioremap.c:6:
   arch/arc/mm/ioremap.c: At top level:
>> arch/arc/include/asm/io.h:26:17: error: conflicting types for 'iounmap'; have 'void(volatile void *)'
      26 | #define iounmap iounmap
         |                 ^~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:89:41: note: in expansion of macro '_EXPORT_SYMBOL'
      89 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   arch/arc/mm/ioremap.c:62:1: note: in expansion of macro 'EXPORT_SYMBOL'
      62 | EXPORT_SYMBOL(iounmap);
         | ^~~~~~~~~~~~~
   arch/arc/mm/ioremap.c:62:15: note: in expansion of macro 'iounmap'
      62 | EXPORT_SYMBOL(iounmap);
         |               ^~~~~~~
   arch/arc/include/asm/io.h:26:17: note: previous declaration of 'iounmap' with type 'void(void *)'
      26 | #define iounmap iounmap
         |                 ^~~~~~~
   include/asm-generic/io.h:1125:6: note: in expansion of macro 'iounmap'
    1125 | void iounmap(void __iomem *addr);
         |      ^~~~~~~


vim +26 arch/arc/include/asm/io.h

e5bc0478ab6cf5 Vineet Gupta 2016-05-05  22  
f5db19e93f6801 Vineet Gupta 2016-03-16  23  extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
06dfae39d20091 Baoquan He   2023-07-06  24  #define ioremap ioremap
06dfae39d20091 Baoquan He   2023-07-06  25  #define ioremap_prot ioremap_prot
06dfae39d20091 Baoquan He   2023-07-06 @26  #define iounmap iounmap
c1678ffcdea25a Joao Pinto   2016-03-10  27  static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
c1678ffcdea25a Joao Pinto   2016-03-10  28  {
c1678ffcdea25a Joao Pinto   2016-03-10  29  	return (void __iomem *)port;
c1678ffcdea25a Joao Pinto   2016-03-10  30  }
c1678ffcdea25a Joao Pinto   2016-03-10  31  

:::::: The code at line 26 was first introduced by commit
:::::: 06dfae39d20091f3c8aa995f00505e1e148b0b3f arc: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
