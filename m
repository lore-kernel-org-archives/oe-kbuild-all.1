Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B812D31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 05:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677302362; x=1708838362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vjHpxGxqnWA//v6OjUwBNX5IJKbB99pEe49io9ddTo=;
  b=WnzKWI05X8jMO65TQnC7ehDIKfnVT06x2UBSwZ5nvFBCmb9q9GreTs7R
   1W9cE14G8/FHAp/MTUks2iALs6OR2bWPKomRPY43XGBhqHizLTyA3YguE
   e6qTuS5CNXgjf1vCY0H5zJz3/F35xeePb/W7HM9UPw38gIAoyvQSsGjNT
   Ohv1qKU0ZjsP41B+PA9XjQ6cSxc4K1H38N4iEWW5GyK/tjpb/Yrq5Nu3x
   UP4stKBckTDsTcvYcN1ce6bk/7lC6rqujUdepOb/FkfSBUoTVcx+wbYwO
   BT/j5ZIxaUFj2DD8ks1sSpjNyOkeyM4t2n3icrzCrYNp9MiyWZIn2FgKE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335874307"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="335874307"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 21:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="622951021"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="622951021"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Feb 2023 21:19:18 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVmxq-0002wf-0r;
	Sat, 25 Feb 2023 05:19:18 +0000
Date: Sat, 25 Feb 2023 13:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Evans <mev@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast
 truncates bits from constant value (5f0ecafe becomes fe)
Message-ID: <202302251316.oOXZoZwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   489fa31ea873282b41046d412ec741f93946fc2d
commit: 6246541522845a443b7ae4a8f0e16facc5a91198 locking/atomic: cmpxchg: Make __generic_cmpxchg_local compare against zero-extended 'old' value
date:   3 weeks ago
config: csky-randconfig-s053-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251316.oOXZoZwJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6246541522845a443b7ae4a8f0e16facc5a91198
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6246541522845a443b7ae4a8f0e16facc5a91198
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash fs/erofs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251316.oOXZoZwJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/erofs/zdata.c: note: in included file (through include/asm-generic/cmpxchg.h, arch/csky/include/asm/cmpxchg.h, include/asm-generic/atomic.h, ...):
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (e0f510cc becomes cc)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (e0f510cc becomes 10cc)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (5f0ecafe becomes fe)
>> include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (5f0ecafe becomes cafe)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (5f0ecafe becomes fe)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (5f0edead becomes ad)
>> include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (5f0ecafe becomes cafe)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (5f0edead becomes dead)

vim +29 include/asm-generic/cmpxchg-local.h

     7	
     8	extern unsigned long wrong_size_cmpxchg(volatile void *ptr)
     9		__noreturn;
    10	
    11	/*
    12	 * Generic version of __cmpxchg_local (disables interrupts). Takes an unsigned
    13	 * long parameter, supporting various types of architectures.
    14	 */
    15	static inline unsigned long __generic_cmpxchg_local(volatile void *ptr,
    16			unsigned long old, unsigned long new, int size)
    17	{
    18		unsigned long flags, prev;
    19	
    20		/*
    21		 * Sanity checking, compile-time.
    22		 */
    23		if (size == 8 && sizeof(unsigned long) != 8)
    24			wrong_size_cmpxchg(ptr);
    25	
    26		raw_local_irq_save(flags);
    27		switch (size) {
    28		case 1: prev = *(u8 *)ptr;
  > 29			if (prev == (u8)old)
  > 30				*(u8 *)ptr = (u8)new;
    31			break;
    32		case 2: prev = *(u16 *)ptr;
  > 33			if (prev == (u16)old)
    34				*(u16 *)ptr = (u16)new;
    35			break;
    36		case 4: prev = *(u32 *)ptr;
    37			if (prev == (u32)old)
    38				*(u32 *)ptr = (u32)new;
    39			break;
    40		case 8: prev = *(u64 *)ptr;
    41			if (prev == old)
    42				*(u64 *)ptr = (u64)new;
    43			break;
    44		default:
    45			wrong_size_cmpxchg(ptr);
    46		}
    47		raw_local_irq_restore(flags);
    48		return prev;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
