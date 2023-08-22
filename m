Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C720183
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 22:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692741931; x=1724277931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pwp9o1vOIFdbHDBHov73qataNq1cU0u6CQb9oE2yJEw=;
  b=h9IBv1ymxJDKXOeJpezimCPnrcU/ayojnCTrCy4RsMU1hWyDstEys5Kx
   fwrCmiY5M8ORJAEOg3LzaOAxBJtJ6Vc9rvhgPjOW+deIzlBWtOoZ4G/6A
   Va0Ypt2pimkpordO97kxqoZYw2CEuBgEUTMVtTuEyePGl9Fi4HBc4TiGC
   8AtEEvxCAN9O18ZVD9HdbilScOWKaaucNCIYeXK96xJaHhF3lq6sOQU5x
   QoQJcZjHgss293w0sVjMOdiNV1BnMuoY6Tt868MSWpvWzUA6rSGsBhqxF
   X4GK/9F5G3viQUw0aANAFdO++kFIqFno6u7RrhErwrbAAtjQxDm6asAap
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460369490"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="460369490"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 15:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983044009"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="983044009"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 15:05:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYZUz-0000Yy-17;
	Tue, 22 Aug 2023 22:05:17 +0000
Date: Wed, 23 Aug 2023 06:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Dexuan Cui <decui@microsoft.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-hyperv/hyperv-next/TDX/0816 1/27]
 arch/x86/include/asm/atomic.h:23: undefined reference to
 `isolation_type_en_snp'
Message-ID: <202308230532.mMWD0mhD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-hyperv/hyperv-next/TDX/0816
head:   269f1434402833526e9c322f860d35aab76386ba
commit: 58ed6a0135731654a525f29fc9c18a2b3d5cc2eb [1/27] x86/hyperv: Add sev-snp enlightened guest static key
config: x86_64-randconfig-x063-20230818 (https://download.01.org/0day-ci/archive/20230823/202308230532.mMWD0mhD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230532.mMWD0mhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230532.mMWD0mhD-lkp@intel.com/

Note: the dcui-tdx/decui/upstream-hyperv/hyperv-next/TDX/0816 HEAD 269f1434402833526e9c322f860d35aab76386ba builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `arch_atomic_read':
>> arch/x86/include/asm/atomic.h:23: undefined reference to `isolation_type_en_snp'
   ld: vmlinux.o: in function `instrument_atomic_read':
>> include/linux/instrumented.h:68: undefined reference to `isolation_type_en_snp'
   ld: vmlinux.o: in function `arch_atomic_read':
>> arch/x86/include/asm/atomic.h:23: undefined reference to `isolation_type_en_snp'
   ld: vmlinux.o: in function `instrument_atomic_read':
>> include/linux/instrumented.h:68: undefined reference to `isolation_type_en_snp'
   ld: vmlinux.o: in function `arch_atomic_set':
   arch/x86/include/asm/atomic.h:28: undefined reference to `isolation_type_en_snp'
   ld: vmlinux.o:arch/x86/include/asm/atomic.h:23: more undefined references to `isolation_type_en_snp' follow


vim +23 arch/x86/include/asm/atomic.h

5abbbbf0b0cd4a Brian Gerst    2010-01-07  11  
5abbbbf0b0cd4a Brian Gerst    2010-01-07  12  /*
5abbbbf0b0cd4a Brian Gerst    2010-01-07  13   * Atomic operations that C can't guarantee us.  Useful for
5abbbbf0b0cd4a Brian Gerst    2010-01-07  14   * resource counting etc..
5abbbbf0b0cd4a Brian Gerst    2010-01-07  15   */
5abbbbf0b0cd4a Brian Gerst    2010-01-07  16  
8bf705d130396e Dmitry Vyukov  2018-01-29  17  static __always_inline int arch_atomic_read(const atomic_t *v)
5abbbbf0b0cd4a Brian Gerst    2010-01-07  18  {
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  19  	/*
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  20  	 * Note for KASAN: we deliberately don't use READ_ONCE_NOCHECK() here,
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  21  	 * it's non-inlined function that increases binary size and stack usage.
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  22  	 */
37f8173dd84936 Peter Zijlstra 2020-01-24 @23  	return __READ_ONCE((v)->counter);
5abbbbf0b0cd4a Brian Gerst    2010-01-07  24  }
5abbbbf0b0cd4a Brian Gerst    2010-01-07  25  

:::::: The code at line 23 was first introduced by commit
:::::: 37f8173dd84936ea78000ed1cad24f8b18d48ebb locking/atomics: Flip fallbacks and instrumentation

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
