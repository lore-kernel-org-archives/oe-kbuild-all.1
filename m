Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A922E48096F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333997; cv=none; b=hqVB5vb3lg4jFXAxd70GZpAtj7DQ9w/4FtTTwPwGxZILAFL/cfSi+kzUf6G6dgbhym4CEJdU+1vAIeQ0blVfcAHATZ5kIu4bzAZmB/RU1QYDwArhJhk00G6QuYzdgE8E4WuL6bdi/+OOse0/NmnUhsznUgrTlXAn3KFzcZydJjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333997; c=relaxed/simple;
	bh=VSb0iIz1rFRxaZA2ikcu1CLD5d+FIEgq37SI144PMMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TYEN2TovPDp6TG25OdmNspT1Vo8UvbNFKsZuDhKFG7TKWSmlilYOF5rESumKnnJdWdhKFQHCg0bHFbzvC89GRQrsrksOJ3ZDw0OpqLYTdKYWQPmNEKUyfRaykFfUBLyRyVDkVAc02PFRoFaGmI7ZsTp8iP+rhadMODWKhkKptGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRmVyQET; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRmVyQET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790333994; x=1821869994;
  h=date:from:to:cc:subject:message-id;
  bh=VSb0iIz1rFRxaZA2ikcu1CLD5d+FIEgq37SI144PMMU=;
  b=dRmVyQET/lhKIWkWssT5R+uGA5/bN83osgMtdPrVR4Owz+xlYzbRgeWF
   2JmiaC89zU0EguIPemkOEe5Dj6gDAvWSn62Y0SaEjBmJzwQu2vbP1zs84
   b7swlbOYPPUHRIOC+CENMt8qmxdNzTZFC8ooI6YVxjSGTZW418GLy+Qbr
   GBZLUTDYAKyJ3sAFtAnwdh3/LmOiprh3Hi8L+aRYATih6z76tjKvgonDq
   sU4GsiGEU8+qnJODjNqeyYEa7uUP/XEhSyyv44vfzlFNaIPVns9okQi25
   ymZv7o7y0muviU1VZIXGXg9Dxg1UX342EH+T/gcJoSak5zLSA2Budv/r2
   g==;
X-CSE-ConnectionGUID: jBpvIe71TeCC7umCepe43A==
X-CSE-MsgGUID: 7MSCSXgYRjiAj8C6scUj0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93837026"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93837026"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:59:53 -0700
X-CSE-ConnectionGUID: Emc4V/vLSLSi5QqGK870WA==
X-CSE-MsgGUID: 14ifftEsTYefrhw20VKdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="302252968"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 03:59:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3ef-00000000KTu-1dpu;
	Fri, 25 Sep 2026 10:59:49 +0000
Date: Fri, 25 Sep 2026 18:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 426/673]
 arch/powerpc/include/asm/io.h:831:17: error: conflicting types for 'iounmap';
 have 'void(volatile void *)'
Message-ID: <202609251813.qFwEdkwe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 34a7b291ebc9fbf0074ef62ba0bdc12fd356c2b1 [426/673] mmio: remove extraneous 'volatile' annotations'
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609251813.qFwEdkwe-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251813.qFwEdkwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251813.qFwEdkwe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from arch/powerpc/mm/ioremap_32.c:3:
>> arch/powerpc/include/asm/io.h:831:17: error: conflicting types for 'iounmap'; have 'void(volatile void *)'
     831 | #define iounmap iounmap
         |                 ^~~~~~~
   arch/powerpc/mm/ioremap_32.c:81:6: note: in expansion of macro 'iounmap'
      81 | void iounmap(volatile void __iomem *addr)
         |      ^~~~~~~
   arch/powerpc/include/asm/io.h:831:17: note: previous declaration of 'iounmap' with type 'void(void *)'
     831 | #define iounmap iounmap
         |                 ^~~~~~~
   include/asm-generic/io.h:1125:6: note: in expansion of macro 'iounmap'
    1125 | void iounmap(void __iomem *addr);
         |      ^~~~~~~
   arch/powerpc/mm/ioremap_32.c: In function 'iounmap':
>> arch/powerpc/mm/ioremap_32.c:90:25: warning: passing argument 1 of 'generic_iounmap' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
      90 |         generic_iounmap(addr);
         |                         ^~~~
   In file included from arch/powerpc/include/asm/io.h:962:
   include/asm-generic/io.h:1126:36: note: expected 'void *' but argument is of type 'volatile void *'
    1126 | void generic_iounmap(void __iomem *addr);
         |                      ~~~~~~~~~~~~~~^~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/powerpc/include/asm/processor.h:41,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from arch/powerpc/include/asm/io.h:22:
   arch/powerpc/mm/ioremap_32.c: At top level:
>> arch/powerpc/include/asm/io.h:831:17: error: conflicting types for 'iounmap'; have 'void(volatile void *)'
     831 | #define iounmap iounmap
         |                 ^~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:89:41: note: in expansion of macro '_EXPORT_SYMBOL'
      89 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   arch/powerpc/mm/ioremap_32.c:92:1: note: in expansion of macro 'EXPORT_SYMBOL'
      92 | EXPORT_SYMBOL(iounmap);
         | ^~~~~~~~~~~~~
   arch/powerpc/mm/ioremap_32.c:92:15: note: in expansion of macro 'iounmap'
      92 | EXPORT_SYMBOL(iounmap);
         |               ^~~~~~~
   arch/powerpc/include/asm/io.h:831:17: note: previous declaration of 'iounmap' with type 'void(void *)'
     831 | #define iounmap iounmap
         |                 ^~~~~~~
   include/asm-generic/io.h:1125:6: note: in expansion of macro 'iounmap'
    1125 | void iounmap(void __iomem *addr);
         |      ^~~~~~~


vim +831 arch/powerpc/include/asm/io.h

894fa235eb4ca0b arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  826  
86c391bd5f47101 arch/powerpc/include/asm/io.h Christophe Leroy       2018-10-09  827  void __iomem *ioremap_coherent(phys_addr_t address, unsigned long size);
f855b2f544d664c arch/powerpc/include/asm/io.h Oliver O'Halloran      2017-04-12  828  #define ioremap_cache(addr, size) \
86758b504864913 arch/powerpc/include/asm/io.h Ryan Roberts           2025-02-18  829  	ioremap_prot((addr), (size), PAGE_KERNEL)
a1f242ff460e4b5 include/asm-powerpc/io.h      Benjamin Herrenschmidt 2008-07-23  830  
8d05554dca2af6a arch/powerpc/include/asm/io.h Christophe Leroy       2023-07-06 @831  #define iounmap iounmap
4cb3cee03d558fd include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  832  

:::::: The code at line 831 was first introduced by commit
:::::: 8d05554dca2af6a77dc38a152f4e84fdf7e35179 powerpc: mm: convert to GENERIC_IOREMAP

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
