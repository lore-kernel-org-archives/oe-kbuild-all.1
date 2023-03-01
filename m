Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBF0EBC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 06:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677650769; x=1709186769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neGwb+rLWeG/QOeJiUYpQFXymqHHwKbB90waRfEGfoA=;
  b=ZFeofTe74fCXTFnhLbfAkrbEUtw1kve/rE11tGJEx9aAFE1wMfenM9fk
   1ofq8ucq5E2bpKZ8dHkdcHjLSevRy4dHlJ9lPN22BLS0TcRky5v48jWwl
   1p9g1/Vh46a6qbTOjbzZPUPT+x+W/qoVyrui2Xj2ozq/EN+CgkJUJ615a
   SA9UtArkVyU2Rj//fCJ7zEI+NWVlAnXXCR+9HTrxB3MZEHHrH//zTpQHH
   lZAhbpwbPhaKZ7h0YTUfSJLwt0F4NIYQVWLGT4BGCDccjYvWMlYIE6QnP
   ppaTdEHzsO899eXkmwDXoXbY+9eA4IDsWLTk5Y3QI8ecRItRVW8TzihIN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="420590065"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="420590065"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 22:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003533405"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="1003533405"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2023 22:06:07 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXFbK-0005wd-1y;
	Wed, 01 Mar 2023 06:06:06 +0000
Date: Wed, 1 Mar 2023 14:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:tglx/devel/rcuref 2/3]
 include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates
 bits from constant value (e0000000 becomes 0)
Message-ID: <202303011432.wytVFQ48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/rcuref
head:   9dcf0830de36103b3a5ed2bdd1bfa5cbcc1032d8
commit: 212b3a6f7d18535cb6b745193608bf2ffaf111b9 [2/3] atomics: Provide rcuref - scalable reference counting
config: nios2-randconfig-s032-20230226 (https://download.01.org/0day-ci/archive/20230301/202303011432.wytVFQ48-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/212b3a6f7d18535cb6b745193608bf2ffaf111b9
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tglx/devel/rcuref
        git checkout 212b3a6f7d18535cb6b745193608bf2ffaf111b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303011432.wytVFQ48-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/rcuref.c: note: in included file (through include/asm-generic/cmpxchg.h, arch/nios2/include/generated/asm/cmpxchg.h, include/asm-generic/atomic.h, ...):
>> include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (e0000000 becomes 0)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (e0000000 becomes 0)

vim +30 include/asm-generic/cmpxchg-local.h

068fbad288a2c1 Mathieu Desnoyers 2008-02-07   7  
aa93685afbefa0 Behan Webster     2012-11-20   8  extern unsigned long wrong_size_cmpxchg(volatile void *ptr)
aa93685afbefa0 Behan Webster     2012-11-20   9  	__noreturn;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  10  
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  11  /*
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  12   * Generic version of __cmpxchg_local (disables interrupts). Takes an unsigned
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  13   * long parameter, supporting various types of architectures.
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  14   */
6988631bdfddce Mark Rutland      2021-05-25  15  static inline unsigned long __generic_cmpxchg_local(volatile void *ptr,
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  16  		unsigned long old, unsigned long new, int size)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  17  {
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  18  	unsigned long flags, prev;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  19  
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  20  	/*
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  21  	 * Sanity checking, compile-time.
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  22  	 */
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  23  	if (size == 8 && sizeof(unsigned long) != 8)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  24  		wrong_size_cmpxchg(ptr);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  25  
5042afe7fe3239 Ingo Molnar       2009-07-03  26  	raw_local_irq_save(flags);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  27  	switch (size) {
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  28  	case 1: prev = *(u8 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  29  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07 @30  			*(u8 *)ptr = (u8)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  31  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  32  	case 2: prev = *(u16 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  33  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  34  			*(u16 *)ptr = (u16)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  35  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  36  	case 4: prev = *(u32 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  37  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  38  			*(u32 *)ptr = (u32)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  39  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  40  	case 8: prev = *(u64 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  41  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  42  			*(u64 *)ptr = (u64)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  43  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  44  	default:
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  45  		wrong_size_cmpxchg(ptr);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  46  	}
5042afe7fe3239 Ingo Molnar       2009-07-03  47  	raw_local_irq_restore(flags);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  48  	return prev;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  49  }
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  50  

:::::: The code at line 30 was first introduced by commit
:::::: 068fbad288a2c18b75b0425fb56d241f018a1cb5 Add cmpxchg_local to asm-generic for per cpu atomic operations

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
