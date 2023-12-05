Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270EC41747
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeL98mls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701780695; x=1733316695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+aBzqibSkgdY20mrJrcQ4VsZLRZr+fU4Br1YGYEix8=;
  b=IeL98mls4Upudr1OgiDQ0RF5DvcBFvDlyAr33WXijyz9655mJkuLutIq
   0sSXhPn/zeatHJ91ANvs4cKoqdN3TvwrIeLxdMikIsjHahr/Wc6qqA5PI
   XF2g4FAw6KWpGdgG6yh7v/1YdBjPPEQxCVWSoGSB/uTtJvg+MzHGUVQAT
   kXjehdD8vdstfCQX7wUs8x/4YPk8ULVicPFuEk11EDog6Tw52LXPztnkA
   tBSPqAAo20jEYWY+q1r+H09ovKzUzZOE5gze5D+M+uYN2gsrr+Kg0i25x
   x7K/QazynIWiM5hKYgeimJ8SpjNLcCbiv/qFrCwKvVo+il5SFD0S7kDkv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="397785147"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="397785147"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:51:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="770903774"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="770903774"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 04:51:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUtc-0008zH-0O;
	Tue, 05 Dec 2023 12:51:28 +0000
Date: Tue, 5 Dec 2023 20:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4620/4884] include/linux/io.h:92:16: error:
 implicit declaration of function 'ioremap_np'; did you mean 'ioremap_uc'?
Message-ID: <202312052001.PB9V8WNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 17229c19e5bf0b5dc8b68dc4ca4e7012e7da4747 [4620/4884] mips: remove extraneous asm-generic/iomap.h include
config: mips-xway_defconfig (https://download.01.org/0day-ci/archive/20231205/202312052001.PB9V8WNH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052001.PB9V8WNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052001.PB9V8WNH-lkp@intel.com/

Note: the linux-next/master HEAD 0f5f12ac05f36f117e793656c3f560625e927f1b builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/mips-cps.h:11,
                    from arch/mips/include/asm/smp-ops.h:16,
                    from arch/mips/include/asm/smp.h:21,
                    from include/linux/smp.h:113,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
   include/linux/io.h: In function 'pci_remap_cfgspace':
>> include/linux/io.h:92:16: error: implicit declaration of function 'ioremap_np'; did you mean 'ioremap_uc'? [-Werror=implicit-function-declaration]
      92 |         return ioremap_np(offset, size) ?: ioremap(offset, size);
         |                ^~~~~~~~~~
         |                ioremap_uc
>> include/linux/io.h:92:42: warning: pointer/integer type mismatch in conditional expression
      92 |         return ioremap_np(offset, size) ?: ioremap(offset, size);
         |                                          ^
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +92 include/linux/io.h

7d3dcf26a6559fa Christoph Hellwig 2015-08-10  70  
4d312ac057da57b Arnd Bergmann     2023-05-16  71  /* architectures can override this */
4d312ac057da57b Arnd Bergmann     2023-05-16  72  pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phys_addr,
4d312ac057da57b Arnd Bergmann     2023-05-16  73  					unsigned long size, pgprot_t prot);
4d312ac057da57b Arnd Bergmann     2023-05-16  74  
4d312ac057da57b Arnd Bergmann     2023-05-16  75  
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  76  #ifdef CONFIG_PCI
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  77  /*
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  78   * The PCI specifications (Rev 3.0, 3.2.5 "Transaction Ordering and
b10eb2d50911f98 Hector Martin     2021-03-25  79   * Posting") mandate non-posted configuration transactions. This default
b10eb2d50911f98 Hector Martin     2021-03-25  80   * implementation attempts to use the ioremap_np() API to provide this
b10eb2d50911f98 Hector Martin     2021-03-25  81   * on arches that support it, and falls back to ioremap() on those that
b10eb2d50911f98 Hector Martin     2021-03-25  82   * don't. Overriding this function is deprecated; arches that properly
b10eb2d50911f98 Hector Martin     2021-03-25  83   * support non-posted accesses should implement ioremap_np() instead, which
b10eb2d50911f98 Hector Martin     2021-03-25  84   * this default implementation can then use to return mappings compliant with
b10eb2d50911f98 Hector Martin     2021-03-25  85   * the PCI specification.
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  86   */
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  87  #ifndef pci_remap_cfgspace
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  88  #define pci_remap_cfgspace pci_remap_cfgspace
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  89  static inline void __iomem *pci_remap_cfgspace(phys_addr_t offset,
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  90  					       size_t size)
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  91  {
b10eb2d50911f98 Hector Martin     2021-03-25 @92  	return ioremap_np(offset, size) ?: ioremap(offset, size);
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  93  }
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  94  #endif
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  95  #endif
cf9ea8ca4a0bea7 Lorenzo Pieralisi 2017-04-19  96  

:::::: The code at line 92 was first introduced by commit
:::::: b10eb2d50911f98a8f1cacf00b1b677339593f4c asm-generic/io.h: implement pci_remap_cfgspace using ioremap_np

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
