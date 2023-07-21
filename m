Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3C7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 02:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689906986; x=1721442986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoQr8bVUind6p8PAVMxgg6SnulK8bkTs323d/8qxmWM=;
  b=BhC9VR2c51J3SthchfnNkzx0FtcmvcSi8AlDwsCXJIoT9Kly9iPpJQdO
   xi1XtW/dLTIQ8ZqqdvpUBywfcSTy2TqCsbbYUF0mFqPiC89fq3B3dZbuZ
   8xVf/25vdM3gHY9mdVV2N/YH8lFM/azsTR5pv5xdFY2hh9euv1bWAh92X
   +69/J51g+UgQ3G+VdvgU5T93TPu78uNRLWvzcY5FxhNTBrc7yQVP1mfGy
   cNd1uNbcuT++GIfG4zIFRQa+/5J7Y8iq560VaBeQ0DKXVKpL/Vyh0pDmj
   S4bg1WmLczcTDSoDbbeDwslz/UweucKJjZn/5ogHrSVx2g4ixVg/aB1BI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="366956574"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="366956574"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 19:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701875989"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="701875989"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 19:36:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMfzs-0006lz-2c;
	Fri, 21 Jul 2023 02:36:09 +0000
Date: Fri, 21 Jul 2023 10:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 15/19]
 arch/riscv/include/asm/bitops.h:214:51: error: 'nr' undeclared
Message-ID: <202307211016.woqQJ6MX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   35ffa765605bc8156660ed51b97fa97f21d88aba
commit: bcf25031ae39ec676a85a99bf0cacdefde781901 [15/19] bitops: Add change_and_unlock_is_negative_byte()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230721/202307211016.woqQJ6MX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211016.woqQJ6MX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211016.woqQJ6MX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/riscv/include/asm/bitops.h: In function 'change_and_unlock_is_negative_byte':
>> arch/riscv/include/asm/bitops.h:214:51: error: 'nr' undeclared (first use in this function)
     214 |                 : "=r" (res), "+A" (addr[BIT_WORD(nr)])
         |                                                   ^~
   include/linux/bits.h:10:35: note: in definition of macro 'BIT_WORD'
      10 | #define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
         |                                   ^~
   arch/riscv/include/asm/bitops.h:214:51: note: each undeclared identifier is reported only once for each function it appears in
     214 |                 : "=r" (res), "+A" (addr[BIT_WORD(nr)])
         |                                                   ^~
   include/linux/bits.h:10:35: note: in definition of macro 'BIT_WORD'
      10 | #define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
         |                                   ^~
   In file included from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
>> arch/riscv/include/asm/bitops.h:208:55: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     208 |                 int lock_bit, volatile unsigned long *addr)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/nr +214 arch/riscv/include/asm/bitops.h

   206	
   207	static inline bool change_and_unlock_is_negative_byte(int change_bit,
 > 208			int lock_bit, volatile unsigned long *addr)
   209	{
   210		unsigned long res, mask;
   211		mask = (1 << change_bit) | (1 << lock_bit);
   212		__asm__ __volatile__ (
   213			__AMO(xor) ".rl %0, %2, %1"
 > 214			: "=r" (res), "+A" (addr[BIT_WORD(nr)])
   215			: "r" (__NOT(mask))
   216			: "memory");
   217		return (res & BIT(7)) != 0;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
